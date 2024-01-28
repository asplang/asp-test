execute_process(
    COMMAND "${ASPS_EXECUTABLE}" "${BYTECODE_FILE}"
    OUTPUT_FILE "${OUTPUT_DIR}/${TEST_NAME}.out"
    ERROR_FILE "${OUTPUT_DIR}/${TEST_NAME}.out"
    RESULT_VARIABLE run_result
    )

if (NOT ("${REFERENCE_DIR}" STREQUAL ""))
    set(extra_diff_opts)
    if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.14")
        set(extra_diff_opts --ignore-eol)
    endif()

    execute_process(
        COMMAND ${CMAKE_COMMAND} -E compare_files ${extra_diff_opts} "${REFERENCE_DIR}/${TEST_NAME}.out" "${OUTPUT_DIR}/${TEST_NAME}.out"
        RESULT_VARIABLE diff_result
        )

    if (NOT (${diff_result} EQUAL 0))
        message(FATAL_ERROR "${TEST_NAME}: Output \"${OUTPUT_DIR}/${TEST_NAME}.out\" differs from the expected output file \"${REFERENCE_DIR}/${TEST_NAME}.out\"")
    endif()
endif()
