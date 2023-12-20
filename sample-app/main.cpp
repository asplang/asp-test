//
// Sample Asp application main.
//

#include "asp.h"
#include "asp-info.h"
#include "sample.h"
#include "scripting.hpp"
#include "functions.hpp"
#include <iostream>
#include <iomanip>
#include <string>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <cerrno>
#include <climits>

#ifndef COMMAND_OPTION_PREFIXES
#error COMMAND_OPTION_PREFIXES macro undefined
#endif

using namespace std;

static const size_t DEFAULT_DATA_ENTRY_COUNT = 2048;

static void Usage()
{
    cerr
        << "Usage:      asps [OPTION]... ["
        << COMMAND_OPTION_PREFIXES[0] << COMMAND_OPTION_PREFIXES[0]
        << "] SCRIPT [ARG]...\n"
        << "\n"
        << "Run the Asp script executable SCRIPT (*.aspe)."
        << " The suffix may be omitted.\n"
        << "If one or more ARG are given,"
        << " they are passed as arguments to the script.\n"
        << "\n"
        << "Use " << COMMAND_OPTION_PREFIXES[0] << COMMAND_OPTION_PREFIXES[0]
        << " before the SCRIPT argument if it starts with an option prefix.\n"
        << "\n"
        << "Options";
    if (strlen(COMMAND_OPTION_PREFIXES) > 1)
    {
        cerr << " (may be prefixed by";
        for (unsigned i = 1; i < strlen(COMMAND_OPTION_PREFIXES); i++)
        {
            if (i != 1)
                cerr << ',';
            cerr << ' ' << COMMAND_OPTION_PREFIXES[i];
        }
        cerr << " instead of " << COMMAND_OPTION_PREFIXES[0] << ')';
    }
    cerr
        << ":\n"
        << COMMAND_OPTION_PREFIXES[0]
        << "h          Print usage information.\n"
        << COMMAND_OPTION_PREFIXES[0]
        << "v          Verbose. Output version and statistical information.\n"
        << COMMAND_OPTION_PREFIXES[0]
        << "c n        Code size, in bytes."
        << " The default behaviour is to determine the size\n"
        << "            from the SCRIPT file."
        << " This default behaviour may also be invoked\n"
        << "            explicitly by specifying 0 for n.\n"
        << COMMAND_OPTION_PREFIXES[0]
        << "d n        Data entry count, where each entry is "
        << AspDataEntrySize() << " bytes."
        << " Default is " << DEFAULT_DATA_ENTRY_COUNT << ".\n"
        ;
}

int main(int argc, char **argv)
{
    // Process command line options.
    bool verbose = false;
    size_t codeByteCount = 0;
    size_t dataEntryCount = DEFAULT_DATA_ENTRY_COUNT;
    unsigned stepCountLimit = UINT_MAX;
    for (; argc >= 2; argc--, argv++)
    {
        string arg1 = argv[1];
        string prefix = arg1.substr(0, 1);
        auto prefixIndex =
            string(COMMAND_OPTION_PREFIXES).find_first_of(prefix);
        if (prefixIndex == string::npos)
            break;
        string option = arg1.substr(1);
        if (option == string(1, COMMAND_OPTION_PREFIXES[prefixIndex]))
        {
            argc--; argv++;
            break;
        }

        if (option == "?" || option == "h")
        {
            Usage();
            return 0;
        }
        else if (option == "c")
        {
            string value = (++argv)[1];
            argc--;
            codeByteCount = static_cast<size_t>(atoi(value.c_str()));
        }
        else if (option == "d")
        {
            string value = (++argv)[1];
            argc--;
            dataEntryCount = static_cast<size_t>(atoi(value.c_str()));
        }
        else if (option == "v")
            verbose = true;
        else
        {
            cerr << "Invalid option: " << arg1 << endl;
            Usage();
            return 1;
        }
    }

    // Obtain executable file name.
    if (argc < 2)
    {
        cerr << "No program specified" << endl;
        Usage();
        return 1;
    }

    // Open the executable file.
    string executableFileName = argv[1];
    auto openExecutable = [](const char *fileName)
    {
        return fopen(fileName, "rb");
    };
    FILE *fp = openExecutable(executableFileName.c_str());
    static const string executableSuffix = ".aspe";
    if (fp == nullptr)
    {
        // Try appending the appropriate suffix if the specified file did not
        // exist.
        executableFileName += executableSuffix;
        fp = openExecutable(executableFileName.c_str());
    }
    if (fp == nullptr)
    {
        cerr
            << "Error opening " << executableFileName
            << ": " << strerror(errno) << endl;
        return 1;
    }

    // Determine byte size of data area.
    size_t dataEntrySize = AspDataEntrySize();
    size_t dataByteSize = dataEntryCount * dataEntrySize;

    // Initialize the Asp engine.
    SampleAspContext context;
    AspEngine engine;
    char *code = nullptr;
    if (codeByteCount != 0)
    {
        code = (char *)malloc(codeByteCount);
        if (code == nullptr)
        {
            cerr << "Error allocating engine code area" << endl;
            return 2;
        }
    }
    char *data = (char *)malloc(dataByteSize);
    if (data == nullptr)
    {
        cerr << "Error allocating engine data area" << endl;
        return 2;
    }
    AspRunResult initializeResult = AspInitialize
        (&engine,
         code, codeByteCount,
         data, dataByteSize,
         &AspAppSpec_sample, &context);
    if (initializeResult != AspRunResult_OK)
    {
        cerr
            << "Initialize error 0x" << hex << uppercase << setfill('0')
            << setw(2) << initializeResult << ": "
            << AspRunResultToString((int)initializeResult) << endl;
        return 2;
    }

    // Load the executable using one of two methods.
    char *externalCode = nullptr;
    AspAddCodeResult sealResult = AspAddCodeResult_OK;
    if (codeByteCount == 0)
    {
        // Determine the size of the executable file.
        int seekResult = fseek(fp, 0, SEEK_END);
        long tellResult = 0;
        if (seekResult == 0)
            tellResult = ftell(fp);
        if (seekResult != 0 || tellResult < 0)
        {
            cerr
                << "Error determining size of " << executableFileName
                << ": " << strerror(errno) << endl;
            return 2;
        }
        size_t externalCodeSize = (size_t)tellResult;
        externalCode = (char *)malloc(externalCodeSize);
        if (externalCode == nullptr)
        {
            cerr << "Error allocating memory for executable code" << endl;
            return 2;
        }
        rewind(fp);

        // Read the entire executable into memory.
        int readResult = fread(externalCode, externalCodeSize, 1, fp);
        if (readResult != 1 || feof(fp) || ferror(fp))
        {
            cerr
                << "Error reading " << executableFileName
                << ": " << strerror(errno) << endl;
            return 2;
        }

        sealResult = AspSealCode
            (&engine, externalCode, externalCodeSize);
    }
    else
    {
        while (true)
        {
            char c = fgetc(fp);
            if (feof(fp))
                break;
            if (ferror(fp))
            {
                cerr
                    << "Error reading " << executableFileName
                    << ": " << strerror(errno) << endl;
                return 2;
            }
            AspAddCodeResult addResult = AspAddCode(&engine, &c, 1);
            if (addResult != AspAddCodeResult_OK)
            {
                cerr
                    << "Load error 0x" << hex << uppercase << setfill('0')
                    << setw(2) << addResult << ": "
                    << AspAddCodeResultToString((int)addResult) << endl;
                return 2;
            }
        }
        AspAddCodeResult sealResult = AspSeal(&engine);
    }
    fclose(fp);
    if (sealResult != AspAddCodeResult_OK)
    {
        cerr
            << "Seal error 0x" << hex << uppercase << setfill('0')
            << setw(2) << sealResult << ": "
            << AspAddCodeResultToString((int)sealResult) << endl;
        return 2;
    }

    // Report version information.
    if (verbose)
    {
        uint8_t engineVersion[4], codeVersion[4];
        AspEngineVersion(engineVersion);
        AspCodeVersion(&engine, codeVersion);
        cout << "Engine version: ";
        for (unsigned i = 0; i < sizeof engineVersion; i++)
        {
            if (i != 0)
                cout.put('.');
            cout << static_cast<unsigned>(engineVersion[i]);
        }
        cout << endl;
        cout << "Code version: ";
        for (unsigned i = 0; i < sizeof codeVersion; i++)
        {
            if (i != 0)
                cout.put('.');
            cout << static_cast<unsigned>(codeVersion[i]);
        }
        cout << endl;
    }

    // Set arguments.
    AspRunResult argumentResult = AspSetArguments(&engine, argv + 2);
    if (argumentResult != AspRunResult_OK)
    {
        cerr
            << "Arguments error 0x" << hex << uppercase << setfill('0')
            << setw(2) << argumentResult << ": "
            << AspRunResultToString((int)argumentResult) << endl;
        return 2;
    }

    // Run the code.
    AspRunResult runResult = AspRunResult_OK;
    unsigned stepCount = 0;
    for (;
         runResult == AspRunResult_OK &&
         (stepCountLimit == UINT_MAX || stepCount < stepCountLimit);
         stepCount++)
    {
        runResult = AspStep(&engine);
    }

    // Clean up application objects created during the run.
    ScriptCleanup();

    // Check completion status of the run.
    if (runResult != AspRunResult_Complete)
    {
        auto oldFlags = cerr.flags();
        auto oldFill = cerr.fill();
        cerr
            << "Run error 0x" << hex << uppercase << setfill('0')
            << setw(2) << runResult << ": "
            << AspRunResultToString((int)runResult) << endl;
        cerr.flags(oldFlags);
        cerr.fill(oldFill);

        // Report the program counter.
        auto programCounter = AspProgramCounter(&engine);
        cerr
            << "Program counter: 0x" << hex << uppercase << setfill('0')
            << setw(7) << programCounter;
        cerr.flags(oldFlags);
        cerr.fill(oldFill);

        // Attempt to translate the program counter into a source location
        // using the associated source info file.
        size_t suffixPos =
            executableFileName.size() - executableSuffix.size();
        static const string sourceInfoSuffix = ".aspd";
        string sourceInfoFileName =
            executableFileName.substr(0, suffixPos) + sourceInfoSuffix;
        AspSourceInfo *sourceInfo = AspLoadSourceInfoFromFile
            (sourceInfoFileName.c_str());
        if (sourceInfo != nullptr)
        {
            AspSourceLocation sourceLocation = AspGetSourceLocation
                (sourceInfo, programCounter);
            if (sourceLocation.fileName != nullptr)
                cerr
                    << "; " << sourceLocation.fileName << ':'
                    << sourceLocation.line << ':' << sourceLocation.column;
            AspUnloadSourceInfo(sourceInfo);
        }
        cerr << endl;
    }

    // Report low free count.
    if (verbose)
    {
        cout
            << "Low free count: "
            << AspLowFreeCount(&engine)
            << " (max " << AspMaxDataSize(&engine) << ')' << endl;
    }

    if (code != nullptr)
        free(code);
    if (externalCode != nullptr)
        free(externalCode);
    free(data);

    return runResult == AspRunResult_Complete ? 0 : 2;
}
