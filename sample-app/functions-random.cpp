//
// Sample Asp application functions implementation: random numbers.
//

#include "functions-random.hpp"
#include "sample.h"
#include "scripting.hpp"
#include <asp.h>
#include <map>
#include <random>

using namespace std;

static int32_t gNextObjectIndex = 0;

enum class DistributionType
{
    Integer, Real
};

struct Distribution
{
    Distribution
        (DistributionType type,
         const minstd_rand &generator,
         const uniform_int_distribution<int32_t> &distribution) :
        type(type),
        generator(generator),
        intDistribution(distribution)
    {
    }

    Distribution
        (DistributionType type,
         const minstd_rand &generator,
         const uniform_real_distribution<double> &distribution) :
        type(type),
        generator(generator),
        floatDistribution(distribution)
    {
    }

    DistributionType type;
    minstd_rand generator;
    union
    {
        uniform_int_distribution<int32_t> intDistribution;
        uniform_real_distribution<double> floatDistribution;
    };
};

static map<int32_t, Distribution> gObjects;

static void DestroyObject(AspEngine *, int16_t type, int32_t value);

/* rng(low, high, seed)
 * Create a random number generator.
 * The resulting generator generates floats if either low or high is float,
 * otherwise integers are generated.
 */
extern "C" AspRunResult asp_rng
    (AspEngine *engine,
     AspDataEntry *low, AspDataEntry *high, AspDataEntry *seed,
     AspDataEntry **returnValue)
{
    if (!AspIsNumeric(low) || !AspIsNumeric(high) || !AspIsInteger(seed))
        return AspRunResult_UnexpectedType;
    int32_t seedValue;
    AspIntegerValue(seed, &seedValue);
    int32_t objectIndex = gNextObjectIndex++;
    if (AspIsIntegral(low) && AspIsIntegral(high))
    {
        int32_t lowValue, highValue;
        AspIntegerValue(low, &lowValue);
        AspIntegerValue(high, &highValue);
        gObjects.emplace(make_pair
            (objectIndex,
             Distribution
                (DistributionType::Integer,
                 minstd_rand(seedValue),
                 uniform_int_distribution<int32_t>(lowValue, highValue))));
    }
    else
    {
        double lowValue, highValue;
        AspFloatValue(low, &lowValue);
        AspFloatValue(high, &highValue);
        gObjects.emplace(make_pair
            (objectIndex,
             Distribution
                (DistributionType::Real,
                 minstd_rand(seedValue),
                 uniform_real_distribution<double>(lowValue, highValue))));
    }

    *returnValue = AspNewAppIntegerObject
        (engine,
         static_cast<int16_t>(ScriptObjectType::RandomNumberGenerator),
         objectIndex, DestroyObject);
    return *returnValue == 0 ?
        AspRunResult_OutOfDataMemory : AspRunResult_OK;
}

extern "C" AspRunResult asp_rand
    (AspEngine *engine,
     AspDataEntry *rng,
     AspDataEntry **returnValue)
{
    int16_t typeValue;
    int32_t objectValue;
    if (!AspAppIntegerObjectValues(engine, rng, &typeValue, &objectValue) ||
        typeValue
        != static_cast<int16_t>(ScriptObjectType::RandomNumberGenerator))
        return AspRunResult_UnexpectedType;

    auto iter = gObjects.find(objectValue);
    if (iter == gObjects.end())
        return AspRunResult_Application;

    switch (iter->second.type)
    {
        case DistributionType::Integer:
            *returnValue = AspNewInteger
                (engine,
                 iter->second.intDistribution(iter->second.generator));
            break;

        case DistributionType::Real:
            *returnValue = AspNewFloat
                (engine,
                 iter->second.floatDistribution(iter->second.generator));
            break;
    }

    return *returnValue == 0 ?
        AspRunResult_OutOfDataMemory : AspRunResult_OK;
}

void ScriptRandomNumberCleanup()
{
    gObjects.clear();
    gNextObjectIndex = 0;
}

static void DestroyObject(AspEngine *engine, int16_t type, int32_t value)
{
    (void)engine;
    gObjects.erase(value);
}
