execute_process(
    COMMAND "${ASPC_EXECUTABLE}" -o "${BYTECODE_FILE}" "${ASPEC_FILE}" "${SOURCE_FILE}"
    ERROR_FILE "${OUTPUT_DIR}/${TEST_NAME}.aspc.err.txt"
    RESULT_VARIABLE compile_result
)

set(extra_diff_opts)
if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.14")
    set(extra_diff_opts --ignore-eol)
endif()

set(test_result 0)
if (NOT ("${REFERENCE_DIR}" STREQUAL ""))
    execute_process(
        COMMAND ${CMAKE_COMMAND} -E compare_files ${extra_diff_opts} "${REFERENCE_DIR}/${TEST_NAME}.aspc.err.txt" "${OUTPUT_DIR}/${TEST_NAME}.aspc.err.txt"
        RESULT_VARIABLE diff_result
    )

    if (NOT (${diff_result} EQUAL 0))
        set(test_result 1)
        message(NOTICE "${TEST_NAME}: aspc output differs from the expected output file \"${REFERENCE_DIR}/${TEST_NAME}.aspc.err.txt\"")
    endif()
endif()

if (${compile_result} EQUAL 0)
    execute_process(
        COMMAND "${ASPS_EXECUTABLE}" -T 2 -u "${OUTPUT_DIR}/${TEST_NAME}.dump.txt" "${BYTECODE_FILE}" ${TEST_ARGS}
        OUTPUT_FILE "${OUTPUT_DIR}/${TEST_NAME}.out.txt"
        ERROR_FILE "${OUTPUT_DIR}/${TEST_NAME}.trace.txt"
        RESULT_VARIABLE run_result
        )

    if (NOT ("${REFERENCE_DIR}" STREQUAL ""))
        foreach(suffix .out.txt .trace.txt .dump.txt)
            execute_process(
                COMMAND ${CMAKE_COMMAND} -E compare_files ${extra_diff_opts} "${REFERENCE_DIR}/${TEST_NAME}${suffix}" "${OUTPUT_DIR}/${TEST_NAME}${suffix}"
                RESULT_VARIABLE diff_result
                )

            if (NOT (${diff_result} EQUAL 0))
                set(test_result 1)
                message(NOTICE "${TEST_NAME}: Output \"${OUTPUT_DIR}/${TEST_NAME}${suffix}\" differs from the expected output file \"${REFERENCE_DIR}/${TEST_NAME}${suffix}\"")
            endif()
        endforeach()
    endif()
else()
    # Delete any old output files if compile fails
    file(REMOVE "${OUTPUT_DIR}/${TEST_NAME}.dump.txt" "${OUTPUT_DIR}/${TEST_NAME}.out.txt" "${OUTPUT_DIR}/${TEST_NAME}.trace.txt")
endif()

if (NOT (${test_result} EQUAL 0))
    message(FATAL_ERROR "${TEST_NAME}: Test failed")
endif()
