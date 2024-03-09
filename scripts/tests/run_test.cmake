execute_process(
    COMMAND "${ASPS_EXECUTABLE}" -T 2 -u "${OUTPUT_DIR}/${TEST_NAME}.dump.txt" "${BYTECODE_FILE}"
    OUTPUT_FILE "${OUTPUT_DIR}/${TEST_NAME}.out.txt"
    ERROR_FILE "${OUTPUT_DIR}/${TEST_NAME}.trace.txt"
    RESULT_VARIABLE run_result
    )

if (NOT ("${REFERENCE_DIR}" STREQUAL ""))
    set(extra_diff_opts)
    if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.14")
        set(extra_diff_opts --ignore-eol)
    endif()

    set(test_result 0)
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

    if (NOT (${test_result} EQUAL 0))
        message(FATAL_ERROR "${TEST_NAME}: Test failed")
    endif()
endif()
