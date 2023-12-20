//
// Sample Asp application functions implementation: file support.
//

#include "functions-file.hpp"
#include "sample.h"
#include "scripting.hpp"
#include <asp.h>
#include <cstdio>
#include <set>
#include <string>
#include <cstring>

using namespace std;

static const size_t BufferSize = 16;
static set<FILE *> gObjects;

static void DestroyObject(AspEngine *, int16_t type, void *value);

/* file_open(name, mode)
 */
extern "C" AspRunResult asp_file_open
    (AspEngine *engine,
     AspDataEntry *name, AspDataEntry *mode,
     AspDataEntry **returnValue)
{
    AspRunResult result;

    string nameValue, modeValue;
    result = ScriptString(engine, name, nameValue);
    if (result != AspRunResult_OK)
        return result;
    result = ScriptString(engine, mode, modeValue);
    if (result != AspRunResult_OK)
        return result;

    FILE *fp = fopen(nameValue.c_str(), modeValue.c_str());
    if (fp == 0)
        return AspRunResult_OK;

    gObjects.insert(fp);

    *returnValue = AspNewAppPointerObject
        (engine,
         static_cast<int16_t>(ScriptObjectType::OpenFile),
         fp, DestroyObject);
    return *returnValue == 0 ?
        AspRunResult_OutOfDataMemory : AspRunResult_OK;
}

/* file_at_end(file)
 */
extern "C" AspRunResult asp_file_at_end
    (AspEngine *engine,
     AspDataEntry *file,
     AspDataEntry **returnValue)
{
    int16_t typeValue;
    void *objectValue;
    if (!AspAppPointerObjectValues(engine, file, &typeValue, &objectValue))
        return AspRunResult_UnexpectedType;
    if (typeValue != static_cast<int16_t>(ScriptObjectType::OpenFile))
        return AspRunResult_UnexpectedType;

    auto fp = reinterpret_cast<FILE *>(objectValue);
    auto iter = gObjects.find(fp);
    if (iter == gObjects.end())
        return AspRunResult_Application;

    *returnValue = AspNewBoolean(engine, feof(fp));
    return AspRunResult_OK;
}

/* file_get_line(file)
 */
extern "C" AspRunResult asp_file_get_line
    (AspEngine *engine,
     AspDataEntry *file,
     AspDataEntry **returnValue)
{
    int16_t typeValue;
    void *objectValue;
    if (!AspAppPointerObjectValues(engine, file, &typeValue, &objectValue))
        return AspRunResult_UnexpectedType;
    if (typeValue != static_cast<int16_t>(ScriptObjectType::OpenFile))
        return AspRunResult_UnexpectedType;

    auto fp = reinterpret_cast<FILE *>(objectValue);
    auto iter = gObjects.find(fp);
    if (iter == gObjects.end())
        return AspRunResult_Application;

    string s;
    while (!feof(fp) && !ferror(fp))
    {
        char buffer[BufferSize];
        fgets(buffer, sizeof buffer, fp);
        size_t len = strlen(buffer);
        if (buffer[len - 1] == '\n')
        {
            s.append(buffer, len - 1);
            break;
        }
        s.append(buffer, len);
    }

    if (ferror(fp))
        return AspRunResult_Application;

    *returnValue = AspNewString(engine, s.c_str(), s.size());
    return *returnValue == 0 ?
        AspRunResult_OutOfDataMemory : AspRunResult_OK;
}

/* file_put_line(file, s)
 */
extern "C" AspRunResult asp_file_put_line
    (AspEngine *engine,
     AspDataEntry *file, AspDataEntry *s,
     AspDataEntry **returnValue)
{
    AspRunResult result;

    int16_t typeValue;
    void *objectValue;
    if (!AspAppPointerObjectValues(engine, file, &typeValue, &objectValue))
        return AspRunResult_UnexpectedType;
    if (typeValue != static_cast<int16_t>(ScriptObjectType::OpenFile))
        return AspRunResult_UnexpectedType;

    auto fp = reinterpret_cast<FILE *>(objectValue);
    auto iter = gObjects.find(fp);
    if (iter == gObjects.end())
        return AspRunResult_Application;

    string sValue;
    result = ScriptString(engine, s, sValue);
    if (result != AspRunResult_OK)
        return result;
    sValue += '\n';
    fputs(sValue.c_str(), fp);

    *returnValue = AspNewBoolean(engine, !ferror(fp));
    return *returnValue == 0 ?
        AspRunResult_OutOfDataMemory : AspRunResult_OK;
}

void ScriptFileCleanup()
{
    for (auto iter = gObjects.begin(); iter != gObjects.end(); iter++)
    {
        FILE *fp = reinterpret_cast<FILE *>(*iter);
        fclose(fp);
    }

    gObjects.clear();
}

static void DestroyObject(AspEngine *engine, int16_t type, void *value)
{
    (void)engine;
    gObjects.erase(reinterpret_cast<FILE *>(value));
}
