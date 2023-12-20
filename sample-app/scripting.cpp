//
// Sample Asp application scripting implementation.
//

#include "scripting.hpp"

using namespace std;

AspRunResult ScriptString
    (AspEngine *engine, AspDataEntry *value, string &result)
{
    AspDataEntry *valueString = AspToString(engine, value);
    if (valueString == 0)
        return AspRunResult_OutOfDataMemory;

    result.clear();
    size_t size;
    AspStringValue(engine, valueString, &size, 0, 0, 0);
    char buffer[16];
    for (size_t index = 0; index < size; index += sizeof buffer)
    {
        size_t bufferLen = sizeof buffer;
        if (index + sizeof buffer > size)
            bufferLen = size - index;
        AspStringValue(engine, valueString, 0, buffer, index, sizeof buffer);
        result.append(buffer, bufferLen);
    }

    return AspRunResult_OK;
}
