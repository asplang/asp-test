#include "fuzz.h"
#include <asp-ver.h>
#include <asp.h>
#include <cstdint>
#include <cstring>
#include <exception>
#include <vector>

#include <ctime>

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *fuzzData, size_t fuzzDataSize)
{
    /* Limit maximum size of the data */
    static constexpr size_t maxDataEntryCount = 4000;

    if (fuzzDataSize < 3)
        return 0;

    // First 2 bytes of fuzzData are used to determine data entry count
    size_t dataEntryCount = fuzzData[0] + (fuzzData[1] << 8);
    if (dataEntryCount > maxDataEntryCount)
        return 0;

    const uint8_t *byteCode = &fuzzData[2];
    size_t byteCodeSize = fuzzDataSize - 2;

    size_t dataEntrySize = AspDataEntrySize();
    size_t dataByteSize = dataEntryCount * dataEntrySize;

    /* Initialize the Asp engine. */
    AspEngine engine;
    std::vector<char> dataBuffer(dataByteSize);
    AspRunResult initializeResult = AspInitialize(&engine,
                                                  nullptr,
                                                  0,
                                                  dataBuffer.data(),
                                                  dataByteSize,
                                                  &AspAppSpec_fuzz,
                                                  nullptr);
    if (initializeResult != AspRunResult_OK) {
        if (initializeResult == AspRunResult_OutOfDataMemory) {
            return 0;
        }

        // Shouldn't happen so crash the fuzzer to indicate erroneous condition
        std::terminate();
    }

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

    /* Allocate separate buffer code so that we can include valid header
       We don't want to waste fuzzing time for that and bumping version number would mess with existing corpus
       as every input that previously worked now doesn't work anymore
    */
    std::vector<uint8_t> codeBuffer(byteCodeSize + headerSize);
    std::memcpy(&codeBuffer[0], header, headerSize);
    std::memcpy(&codeBuffer[headerSize], byteCode, byteCodeSize);

    AspAddCodeResult sealCodeResult = AspSealCode(&engine,
                                                  codeBuffer.data(),
                                                  byteCodeSize + headerSize);
    if (sealCodeResult != AspAddCodeResult_OK) {
        // This shouldn't never happen as we have created valid header
        std::terminate();
    }

    // We don't want to get stuck in infinite loop
    static constexpr size_t maxStepCount = 1000;

    // Run the code.
    AspRunResult runResult = AspRunResult_OK;
    for (size_t stepCount = 0; stepCount < maxStepCount; ++stepCount) {
        runResult = AspStep(&engine);

        if (runResult != AspRunResult_OK) {
            // We are just trying to find crashes. Running random byte code usually should fail
            break;
        }
    }

    return 0; // Values other than 0 and -1 are reserved for future use.
}
