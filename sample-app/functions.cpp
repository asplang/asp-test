//
// Sample Asp application script functions implementation.
//

#include "functions-random.hpp"
#include "functions-file.hpp"

void ScriptCleanup()
{
    ScriptRandomNumberCleanup();
    ScriptFileCleanup();
}
