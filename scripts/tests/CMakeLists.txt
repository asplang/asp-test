
# This directory must not contain any other data as it is destroyed and recreated when
set(TEST_REFERENCE_DATA_DIR "${CMAKE_CURRENT_SOURCE_DIR}/regression-data" CACHE PATH "Directory that contains reference output data for regression tests")

set(regression_tests
    args1.asp
    args2.asp
    assign.asp
    aug.asp
    bif-int.asp
    bitwise.asp
    concat.asp
    conditional.asp
    deldict.asp
    empty.asp
    equal.asp
    erase-list.asp
    fill-empty.asp
    for-dict.asp
    for.asp
    format.asp
    format-checked.asp
    func-group0.asp
    func-group1.asp
    func-group2.asp
    func-mutpar.asp
    glob1.asp
    glob2.asp
    glob3.asp
    if.asp
    index-list.asp
    index-str.asp
    index-tuple.asp
    ins-dict.asp
    ins-list.asp
    ins-set.asp
    integer-overflow.asp
    iter.asp
    keys1.asp
    keys2.asp
    list-assign.asp
    logical.asp
    loop0.asp
    loop1.asp
    loops.asp
    math.asp
    member.asp

    # module1.asp
    # module2.asp

    nan.asp
    power.asp
    print.asp
    range.asp
    relop.asp
    repeat.asp
    repr.asp
    seq.asp
    short-circuit.asp
    singleton.asp
    slice-assign.asp
    slice-del.asp
    slice-list.asp
    slice-str.asp
    slice-tuple.asp
    string.asp
    swap1.asp
    swap2.asp
    tuple-assign1.asp
    tuple-assign2.asp
    types.asp
    unary.asp
    while-else.asp
    while.asp

    # recursive-dict.asp
    # recursive-list.asp



    # failure test cases
    ins-nonmut.asp
    ins-tuple.asp
)

add_custom_target(clean-test-reference-data
    COMMAND ${CMAKE_COMMAND} -E remove_directory "${REGRESSION_TEST_DATA_DIR}"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${REGRESSION_TEST_DATA_DIR}"
)

# Make sure that we have a directory ready for the test output
file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/regression-data")

set(compiled_test_scripts)
set(generate_test_data_targets)
foreach(test_script ${regression_tests})
    get_filename_component(base_name "${test_script}" NAME_WE)
    compile_for_standalone(${test_script} ${base_name})
    list(APPEND compiled_test_scripts "${CMAKE_CURRENT_BINARY_DIR}/${base_name}.aspe")

    add_test(NAME ${base_name}
        COMMAND ${CMAKE_COMMAND}
            -D "ASPS_EXECUTABLE=$<TARGET_FILE:asps>"
            -D "TEST_NAME=${base_name}"
            -D "BYTECODE_FILE=${CMAKE_CURRENT_BINARY_DIR}/${base_name}.aspe"
            -D "REFERENCE_DIR=${TEST_REFERENCE_DATA_DIR}"
            -D "OUTPUT_DIR=${CMAKE_CURRENT_BINARY_DIR}/regression-data"
            -D EXPECTED_RUN_RESULT=0
            -P "${CMAKE_CURRENT_SOURCE_DIR}/run_test.cmake"
        VERBATIM
    )

    # Custom target that runs the bytecode and saves it output to the REGRESSION_TEST_DATA_DIR
    add_custom_target(generate-test-reference-data-${base_name}
        COMMAND ${CMAKE_COMMAND}
            -D "ASPS_EXECUTABLE=$<TARGET_FILE:asps>"
            -D "TEST_NAME=${base_name}"
            -D "BYTECODE_FILE=${CMAKE_CURRENT_BINARY_DIR}/${base_name}.aspe"
            -D "OUTPUT_DIR=${TEST_REFERENCE_DATA_DIR}"
            -D EXPECTED_RUN_RESULT=0
            -P "${CMAKE_CURRENT_SOURCE_DIR}/run_test.cmake"
        DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/${base_name}.aspe"
        VERBATIM
    )
    add_dependencies(generate-test-reference-data-${base_name} clean-test-reference-data)
    list(APPEND generate_test_data_targets generate-test-reference-data-${base_name})
endforeach()

add_custom_target(asp-compile-test-scripts ALL
    DEPENDS ${compiled_test_scripts}
)

add_custom_target(generate-test-reference-data)
add_dependencies(generate-test-reference-data ${generate_test_data_targets})

