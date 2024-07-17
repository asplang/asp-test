
# This directory must not contain any other data as it is destroyed and recreated when
set(TEST_REFERENCE_DATA_DIR "${CMAKE_CURRENT_SOURCE_DIR}/regression-data" CACHE PATH "Directory that contains reference output data for regression tests")

set(standalone_regression_tests
    args1.asp
    args1.asp+abc+123
    args2.asp
    args2.asp+you+and+me
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
    fib.asp+10
    fill-empty.asp
    fill-empty.asp+abc+z+pqrs
    folding.asp
    for-dict.asp
    for-return.asp
    for.asp
    format.asp
    format-checked.asp
    func-group0.asp
    func-group1.asp
    func-group2.asp
    func-mutpar.asp
    gcd.asp+32+36
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
    iter1.asp
    iter2.asp
    iter3.asp
    iter4.asp
    iter5.asp
    keys1.asp
    keys2.asp
    list-assign.asp
    logical.asp
    loop0.asp
    loop1.asp
    loops.asp
    math.asp
    math-neg-syntax.asp
    member.asp
    module1.asp
    module2.asp
    nan.asp
    power.asp
    print.asp
    range-basic.asp
    range-const.asp
    range-in.asp
    range-index.asp
    range-len.asp
    range-slice.asp
    #range-slice-big.asp # Output too big; occasionally compare with *.py.
    range-unbounded.asp
    relop.asp
    repeat.asp
    repr.asp
    seq.asp
    short-circuit.asp
    singleton.asp
    sleep.asp
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
    tuple-assign3.asp
    types.asp
    unary.asp
    while-else.asp
    while.asp

    # recursive-dict.asp
    # recursive-list.asp

    # failure test cases
    ins-nonmut.asp
    ins-tuple.asp

    # Failure test cases

    bad-arith.asp
    bad-call1.asp
    bad-call2.asp
    bad-call3.asp
    bad-func1.asp
    bad-func2.asp
    bad-func3.asp
    bad-func4.asp
    bad-func5.asp
    bad-func6.asp
    bad-func7.asp
    bad-func8.asp
    bad-type1.asp
    bad-type2.asp
    bad-type3.asp
)

set(sample_app_regression_tests
    file.asp
    #file.asp+file-in.txt+file-out.txt
    rand.asp
    rand2.asp
)

add_custom_target(clean-test-reference-data
    COMMAND ${CMAKE_COMMAND} -E rm -Rf "${TEST_REFERENCE_DATA_DIR}"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${TEST_REFERENCE_DATA_DIR}"
)

# Make sure that we have a directory ready for the test output
file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/regression-data")

function(parse_test_spec spec test_name_var script_var args_var)
    string(REPLACE "+" ";" list "${spec}")
    list(LENGTH list list_len)
    list(GET list 0 script)
    list(POP_FRONT list)
    get_filename_component(base_name "${script}" NAME_WE)
    if(list_len GREATER 1)
        list(JOIN list "+" args_str)
        set(${test_name_var} "${base_name}+${args_str}" PARENT_SCOPE)
    else()
        set(${test_name_var} "${base_name}" PARENT_SCOPE)
    endif()
    set(${script_var} "${script}" PARENT_SCOPE)
    set(${args_var} "${list}" PARENT_SCOPE)
endfunction()

set(generate_test_data_targets)

foreach(test_spec ${standalone_regression_tests})
    parse_test_spec("${test_spec}" test_name test_script test_args)

    add_test(NAME ${test_name}
        COMMAND ${CMAKE_COMMAND}
            -D "ASPS_EXECUTABLE=$<TARGET_FILE:asps>"
            -D "ASPC_EXECUTABLE=$<TARGET_FILE:aspc>"
            -D "SOURCE_FILE=${CMAKE_CURRENT_SOURCE_DIR}/${test_script}"
            -D "TEST_NAME=${test_name}"
            -D "BYTECODE_FILE=${CMAKE_CURRENT_BINARY_DIR}/${test_name}.aspe"
            -D "TEST_ARGS=${test_args}"
            -D "ASPEC_FILE=${ASP_BINARY_DIR}/standalone/standalone.aspec"
            -D "REFERENCE_DIR=${TEST_REFERENCE_DATA_DIR}"
            -D "OUTPUT_DIR=${CMAKE_CURRENT_BINARY_DIR}/regression-data"
            -D EXPECTED_RUN_RESULT=0
            -P "${CMAKE_CURRENT_SOURCE_DIR}/run_test.cmake"
        VERBATIM
    )

    # Custom target that runs the bytecode and saves it output to the TEST_REFERENCE_DATA_DIR
    add_custom_target(generate-test-reference-data-${test_name}
        COMMAND ${CMAKE_COMMAND}
            -D "ASPS_EXECUTABLE=$<TARGET_FILE:asps>"
            -D "ASPC_EXECUTABLE=$<TARGET_FILE:aspc>"
            -D "SOURCE_FILE=${CMAKE_CURRENT_SOURCE_DIR}/${test_script}"
            -D "TEST_NAME=${test_name}"
            -D "BYTECODE_FILE=${CMAKE_CURRENT_BINARY_DIR}/${test_name}.aspe"
            -D "TEST_ARGS=${test_args}"
            -D "ASPEC_FILE=${ASP_BINARY_DIR}/standalone/standalone.aspec"
            -D "OUTPUT_DIR=${TEST_REFERENCE_DATA_DIR}"
            -D EXPECTED_RUN_RESULT=0
            -P "${CMAKE_CURRENT_SOURCE_DIR}/run_test.cmake"
        DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/${test_script}"
        VERBATIM
    )
    add_dependencies(generate-test-reference-data-${test_name} clean-test-reference-data)
    list(APPEND generate_test_data_targets generate-test-reference-data-${test_name})
endforeach()

foreach(test_spec ${sample_app_regression_tests})
    parse_test_spec("${test_spec}" base_name test_script test_args)
    set(test_name sample-app-${base_name})

    add_test(NAME ${test_name}
        COMMAND ${CMAKE_COMMAND}
            -D "ASPS_EXECUTABLE=$<TARGET_FILE:sample>"
            -D "ASPC_EXECUTABLE=$<TARGET_FILE:aspc>"
            -D "SOURCE_FILE=${sample_SOURCE_DIR}/scripts/${test_script}"
            -D "TEST_NAME=${test_name}"
            -D "BYTECODE_FILE=${CMAKE_CURRENT_BINARY_DIR}/${test_name}.aspe"
            -D "TEST_ARGS=${test_args}"
            -D "ASPEC_FILE=${sample_BINARY_DIR}/sample.aspec"
            -D "REFERENCE_DIR=${TEST_REFERENCE_DATA_DIR}"
            -D "OUTPUT_DIR=${CMAKE_CURRENT_BINARY_DIR}/regression-data"
            -D EXPECTED_RUN_RESULT=0
            -P "${CMAKE_CURRENT_SOURCE_DIR}/run_test.cmake"
        VERBATIM
    )

    # Custom target that runs the bytecode and saves it output to the TEST_REFERENCE_DATA_DIR
    add_custom_target(generate-test-reference-data-${test_name}
        COMMAND ${CMAKE_COMMAND}
            -D "ASPS_EXECUTABLE=$<TARGET_FILE:sample>"
            -D "ASPC_EXECUTABLE=$<TARGET_FILE:aspc>"
            -D "SOURCE_FILE=${sample_SOURCE_DIR}/scripts/${test_script}"
            -D "TEST_NAME=${test_name}"
            -D "BYTECODE_FILE=${CMAKE_CURRENT_BINARY_DIR}/${test_name}.aspe"
            -D "TEST_ARGS=${test_args}"
            -D "ASPEC_FILE=${sample_BINARY_DIR}/sample.aspec"
            -D "OUTPUT_DIR=${TEST_REFERENCE_DATA_DIR}"
            -D EXPECTED_RUN_RESULT=0
            -P "${CMAKE_CURRENT_SOURCE_DIR}/run_test.cmake"
        DEPENDS "${sample_SOURCE_DIR}/scripts/${test_script}"
        VERBATIM
    )
    add_dependencies(generate-test-reference-data-${test_name} clean-test-reference-data)
    list(APPEND generate_test_data_targets generate-test-reference-data-${test_name})
endforeach()

add_custom_target(generate-test-reference-data)
add_dependencies(generate-test-reference-data ${generate_test_data_targets})
