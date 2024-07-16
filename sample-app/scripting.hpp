//
// Sample Asp application scripting definitions.
//

#ifndef SCRIPTING_HPP
#define SCRIPTING_HPP

#include <asp.h>
#include <ctime>
#include <string>

struct SampleAspContext
{
    bool sleeping;
    clock_t expiry;
};

enum class ScriptObjectType
{
    RandomNumberGenerator,
    OpenFile,
};

AspRunResult ScriptString(AspEngine *, AspDataEntry *s, std::string &);

#endif
