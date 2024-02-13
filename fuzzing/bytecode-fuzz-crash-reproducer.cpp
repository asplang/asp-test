#include "fuzz.h"
#include <asp.h>
#include <asp-ver.h>
#include <cstdint>
#include <cstring>
#include <ctime>
#include <exception>
#include <fstream>
#include <iostream>
#include <vector>

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
    size_t fuzzDataSize = input.tellg();
    input.seekg(0);

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

    size_t byteCodeSize = fuzzDataSize - 2;
    std::vector<uint8_t> codeBuffer(byteCodeSize + headerSize);
    if (!input.read((char*)&codeBuffer[headerSize - 2], byteCodeSize + 2)) {
        return -1;
    }
    size_t dataEntryCount = (size_t)codeBuffer[headerSize - 2] + ((size_t)codeBuffer[headerSize - 1] << 8);

    std::memcpy(&codeBuffer[0], header, headerSize);

    if (dataEntryCount == 0)
        return 0;

    size_t dataEntrySize = AspDataEntrySize();
    size_t dataByteSize = dataEntryCount * dataEntrySize;

    /* Initialize the Asp engine. */
    AspEngine engine;
    std::vector<char> dataBuffer(dataByteSize);
    AspRunResult initializeResult
            = AspInitialize(&engine, nullptr, 0, dataBuffer.data(), dataByteSize, &AspAppSpec_fuzz, nullptr);

    if (initializeResult != AspRunResult_OK) {
        if (initializeResult == AspRunResult_OutOfDataMemory) {
            return 0;
        }

        // Shouldn't happen so crash the fuzzer to indicate erroneous condition
        std::terminate();
    }

    AspAddCodeResult sealCodeResult = AspSealCode(&engine, codeBuffer.data(), codeBuffer.size());
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

    return 0;
}
