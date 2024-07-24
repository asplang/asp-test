//
// Sample Asp application functions implementation: print.
//

#include "sample.h"
#include <asp.h>
#include <stdio.h>

static const size_t BufferSize = 16;

static AspRunResult asp_print1(AspEngine *, AspDataEntry *);

/* print(*values, sep, end)
 * Print values to standard output.
 * Separate individual items with the sep value and finish with the end value.
 */
extern "C" AspRunResult asp_print
    (AspEngine *engine,
     AspDataEntry *values, /* iterable group */
     AspDataEntry *sep, AspDataEntry *end,
     AspDataEntry **returnValue)
{
    AspRunResult result = AspRunResult_OK;

    int32_t argCount;
    result = AspCount(engine, values, &argCount);
    for (unsigned i = 0; i < argCount; i++)
    {
        if (i != 0)
        {
            result = asp_print1(engine, sep);
            if (result != AspRunResult_OK)
                return result;
        }

        AspDataEntry *value = AspElement(engine, values, i);
        result = asp_print1(engine, value);
        if (result != AspRunResult_OK)
            return result;
    }

    result = asp_print1(engine, end);
    if (result != AspRunResult_OK)
        return result;

    return AspRunResult_OK;
}

static AspRunResult asp_print1
    (AspEngine *engine, AspDataEntry *value)
{
    AspDataEntry *valueString = AspToString(engine, value);
    if (valueString == 0)
        return AspRunResult_OutOfDataMemory;

    size_t size;
    AspStringValue(engine, valueString, &size, 0, 0, 0);
    char buffer[BufferSize];
    for (size_t index = 0; index < size; index += sizeof buffer)
    {
        size_t bufferLen = sizeof buffer;
        if (index + sizeof buffer > size)
            bufferLen = size - index;
        AspStringValue(engine, valueString, 0, buffer, index, sizeof buffer);
        for (size_t byteIndex = 0; byteIndex < bufferLen; byteIndex++)
            putchar(buffer[byteIndex]);
    }

    AspUnref(engine, valueString);
    return AspRunResult_OK;
}
