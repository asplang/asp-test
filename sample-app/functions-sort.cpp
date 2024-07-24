//
// Sample Asp application functions implementation: sort function.
//

#include "sample.h"
#include "scripting.hpp"
#include <asp.h>

using namespace std;

/* sort(items, compare)
 * Sort the list of items using the given compare function.
 * The bubble sort algorithm is used.
 */
extern "C" AspRunResult asp_sort
    (AspEngine *engine,
     AspDataEntry *items,
     AspDataEntry *compare,
     AspDataEntry **returnValue)
{
    AspRunResult result = AspRunResult_OK;

    // Define local state variable symbols.
    int32_t
        stateSymbol = AspNextSymbol(engine),
        iSymbol = AspNextSymbol(engine),
        nSymbol = AspNextSymbol(engine),
        swappedSymbol = AspNextSymbol(engine);

    int32_t state, i, n;
    bool swapped;
    if (!AspAgain(engine))
    {
        // Perform initial checks and initialize the state values.
        if (!AspIsList(items) || !AspIsFunction(compare))
            return AspRunResult_UnexpectedType;
        state = 0;
        i = 0;
        AspCount(engine, items, &n);
        swapped = true;
    }
    else
    {
        // Load the state values from the previous invocation.
        AspIntegerValue(AspLoadLocal(engine, stateSymbol), &state);
        AspIntegerValue(AspLoadLocal(engine, iSymbol), &i);
        AspIntegerValue(AspLoadLocal(engine, nSymbol), &n);
        swapped = AspIsTrue(engine, AspLoadLocal(engine, swappedSymbol));
    }

    bool exit = false;
    while (!exit)
    {
        switch (state)
        {
            default:
                return AspRunResult_Application;

            case 0:
                if (!swapped)
                    return AspRunResult_OK;

                // Start iterating through the list.
                swapped = false;
                i = 1;
                state++;

                // Fall through...

            case 1:
            {
                // Check if the end of the list has been reached.
                if (i >= n)
                {
                    // Prepare for a new list traveral.
                    n--;
                    state = 0;
                    break;
                }

                // Call the given comparison function.
                AspDataEntry *a = AspElement(engine, items, i - 1);
                AspAddPositionalArgument(engine, a, false);
                AspDataEntry *b = AspElement(engine, items, i);
                AspAddPositionalArgument(engine, b, false);
                state++;
                exit = true;
                result = AspCall(engine, compare);
                break;
            }

            case 2:
            {
                // Fetch and consume the comparison's return value.
                AspDataEntry *compareResultEntry;
                result = AspReturnValue(engine, &compareResultEntry);
                int32_t compareResult;
                if (!AspIntegerValue(compareResultEntry, &compareResult))
                    return AspRunResult_UnexpectedType;
                AspUnref(engine, compareResultEntry);

                // Swap elements if applicable.
                if (compareResult > 0)
                {
                    AspDataEntry *element = AspElement(engine, items, i - 1);
                    AspRef(engine, element);
                    AspListErase(engine, items, i - 1);
                    AspListInsert(engine, items, i, element, true);
                    swapped = true;
                }

                // Prepare for the next iteration.
                i++;
                state = 1;
                break;
            }
        }
    }

    // Store the state values for the next invocation.
    AspDataEntry
        *stateEntry = AspNewInteger(engine, state),
        *iEntry = AspNewInteger(engine, i),
        *nEntry = AspNewInteger(engine, n),
        *swappedEntry = AspNewBoolean(engine, swapped);
    if (stateEntry == 0 || iEntry == 0 || nEntry == 0 || swappedEntry == 0)
        return AspRunResult_OutOfDataMemory;
    AspStoreLocal(engine, stateSymbol, stateEntry, true);
    AspStoreLocal(engine, iSymbol, iEntry, true);
    AspStoreLocal(engine, nSymbol, nEntry, true);
    AspStoreLocal(engine, swappedSymbol, swappedEntry, true);

    return result;
}
