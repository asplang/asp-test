#include "fuzz.h"
#include <asp.h>
#include <asp-ver.h>
#include <cstdint>
#include <cstring>
#include <ctime>
#include <exception>
#include <fstream>
#include <iostream>

int main(int argc, char *argv[])
{
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <fuzz crash data>" << std::endl;
        return -1;
    }

    std::ifstream input(argv[1], std::ios_base::in | std::ios_base::binary);
    if (!input.is_open()) {
        std::cerr << "Failed to open input file" << std::endl;
        return -1;
    }

    input.seekg(0, std::ios::end);

    static constexpr size_t headerSize = 12;
    static const uint8_t header[headerSize] = {
        'A', 's', 'p', 'E',
        (ASP_VERSION >> 24) & 0xff,
        (ASP_VERSION >> 16) & 0xff,
        0,
        0,
        (uint8_t)((AspAppSpec_fuzz.checkValue >> 24) & 0xff),
        (uint8_t)((AspAppSpec_fuzz.checkValue >> 16) & 0xff),
        (uint8_t)((AspAppSpec_fuzz.checkValue >> 8) & 0xff),
        (uint8_t)((AspAppSpec_fuzz.checkValue >> 0) & 0xff)
    };

    size_t fuzzDataSize = input.tellg();
    input.seekg(0);

    size_t byteCodeSize = fuzzDataSize - 2;
    uint8_t *codeBuffer = (uint8_t *) malloc(byteCodeSize + headerSize);
    input.read((char *) &codeBuffer[10], fuzzDataSize);
    input.close();
    size_t dataEntryCount = codeBuffer[10] + (codeBuffer[11] << 8);

    size_t dataEntrySize = AspDataEntrySize();
    size_t dataByteSize = dataEntryCount * dataEntrySize;

    // Initialize the Asp engine.
    AspEngine engine;
    char *data = (char *) malloc(dataByteSize);
    AspRunResult initializeResult
        = AspInitialize(&engine, nullptr, 0, data, dataByteSize, &AspAppSpec_fuzz, nullptr);
    if (initializeResult != AspRunResult_OK) {
        std::free(codeBuffer);
        std::free(data);
        if (initializeResult == AspRunResult_OutOfDataMemory) {
            return 0;
        }

        std::terminate();
    }

    std::memcpy(&codeBuffer[0], header, headerSize);
    AspAddCodeResult sealCodeResult = AspSealCode(&engine, codeBuffer, byteCodeSize + headerSize);
    if (sealCodeResult != AspAddCodeResult_OK) {
        // This shouldn't never happen as we have created valid header
        std::terminate();
    }

    // We don't want to get stuck in infinite loop
    static constexpr size_t maxStepCount = 100000;

    // Run the code.
    AspRunResult runResult = AspRunResult_OK;
    for (size_t stepCount = 0; stepCount < maxStepCount; ++stepCount) {
        runResult = AspStep(&engine);

        if (runResult != AspRunResult_OK)
            break;
    }

    free(data);
    free(codeBuffer);
    return 0; // Values other than 0 and -1 are reserved for future use.
}
