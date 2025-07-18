# Test cases.

# This directory must not contain any other data as it is destroyed and
# recreated when regression data is generated.
set(TEST_REFERENCE_DATA_DIR "${CMAKE_CURRENT_SOURCE_DIR}/regression-data" CACHE PATH "Directory that contains reference output data for regression tests")

set(standalone_regression_tests
    args1.asp
    args1.asp+abc+123
    args2.asp
    args2.asp+you+and+me
    args3.asp
    args3.asp+jackson+5
    assert1.asp
    assert2.asp
    assert3.asp
    assert4.asp
    assign.asp
    aug.asp
    bad-arith-fold-dec1.asp
    bad-arith-fold-dec2.asp
    bad-arith-fold-dec3.asp
    bad-arith-fold-dec4.asp
    bad-arith-fold-dec5.asp
    bad-arith-fold-dec6.asp
    bad-arith-fold-dec7.asp
    bad-arith-fold-dec8.asp
    bad-arith-fold-dec9.asp
    bad-arith-fold-expr01.asp
    bad-arith-fold-expr02.asp
    bad-arith-fold-expr03.asp
    bad-arith-fold-expr04.asp
    bad-arith-fold-expr05.asp
    bad-arith-fold-expr06.asp
    bad-arith-fold-expr07.asp
    bad-arith-fold-expr08.asp
    bad-arith-fold-expr09.asp
    bad-arith-fold-expr10.asp
    bad-arith-fold-expr11.asp
    bad-arith-fold-expr12.asp
    bad-arith-fold-expr13.asp
    bad-arith-fold-expr14.asp
    bad-arith-fold-expr15.asp
    bad-arith-fold-expr16.asp
    bad-arith-fold-expr17.asp
    bad-arith-fold-expr18.asp
    bad-arith-fold-expr19.asp
    bad-arith-fold-expr20.asp
    bad-arith-fold-expr21.asp
    bad-arith-fold-expr22.asp
    bad-arith-fold-expr23.asp
    bad-arith-fold-hex1.asp
    bad-arith-fold-hex2.asp
    bad-arith-fold-hex3.asp
    bad-arith-fold-hex4.asp
    bad-arith-fold-hex5.asp
    bad-arith-fold-hex6.asp
    bad-arith-fold-hex7.asp
    bad-arith-op01.asp
    bad-arith-op02.asp
    bad-arith-op03.asp
    bad-arith-op04.asp
    bad-arith-op05.asp
    bad-arith-op06.asp
    bad-arith-op07.asp
    bad-arith-op08.asp
    bad-arith-op09.asp
    bad-arith-op10.asp
    bad-assign-mismatch.asp
    bad-assign-tuple.asp
    bad-call1.asp
    bad-call2.asp
    bad-call3.asp
    bad-call4.asp
    bad-call5.asp
    bad-const1.asp
    bad-const2.asp
    bad-format-asterisk.asp
    bad-format-incomplete.asp
    bad-format-n.asp
    bad-format-null.asp
    bad-format-p.asp
    bad-func1.asp
    bad-func2.asp
    bad-func3.asp
    bad-func4.asp
    bad-func5.asp
    bad-func6.asp
    bad-func7.asp
    bad-func8.asp
    bad-global.asp
    bad-index1.asp
    bad-index2.asp
    bad-juxta.asp
    bad-literal-bin1.asp
    bad-literal-bin2.asp
    bad-literal-bin3.asp
    bad-literal-bin4.asp
    bad-literal-bin5.asp
    bad-literal-bin6.asp
    bad-literal-bin7.asp
    bad-literal-bin8.asp
    bad-literal-bin9.asp
    bad-literal-dec1.asp
    bad-literal-dec2.asp
    bad-literal-float1.asp
    bad-literal-float2.asp
    bad-literal-float3.asp
    bad-literal-float4.asp
    bad-literal-float5.asp
    bad-literal-float6.asp
    bad-literal-float7.asp
    bad-literal-float8.asp
    bad-literal-hex1.asp
    bad-literal-hex2.asp
    bad-literal-hex3.asp
    bad-literal-hex4.asp
    bad-literal-hex5.asp
    bad-literal-hex6.asp
    bad-literal-hex7.asp
    bad-type1.asp
    bad-type2.asp
    bad-type3.asp
    bif.asp
    bitwise.asp
    comment.asp
    concat.asp
    conditional.asp
    cycle1.asp
    cycle2.asp
    cycle3.asp
    deldict.asp
    empty.asp
    equal.asp
    erase-list.asp
    exit-0.asp
    exit-None.asp
    exit-arg.asp+0x7FFFFEFE
    exit-arg.asp+0x7FFFFEFF
    exit-arg.asp+0x7FFFFF00
    exit-arg.asp+-1
    exit-int.asp
    exit-float1.asp
    exit-float2.asp
    exit-main.asp
    exit-nan.asp
    exit-str.asp
    fib.asp+10
    fill-empty.asp
    fill-empty.asp+abc+z+pqrs
    folding.asp
    for-dict.asp
    for-module.asp
    for-return1.asp
    for-return2.asp
    for.asp
    format-checked.asp
    format.asp
    func-group0.asp
    func-group1.asp
    func-group2.asp
    func-group3.asp
    func-mutpar.asp
    gcd.asp+32+36
    glob1.asp
    glob2.asp
    glob3.asp
    glob4.asp
    glob5.asp
    if.asp
    index-list.asp
    index-str.asp
    index-tuple.asp
    ins-dict.asp
    ins-iter1.asp
    ins-iter2.asp
    ins-iter3.asp
    ins-list1.asp
    ins-list2.asp
    ins-nonmut.asp
    ins-set.asp
    ins-str.asp
    ins-tuple.asp
    integer-overflow.asp
    is.asp
    iter1.asp
    iter2.asp
    iter3.asp
    iter4.asp
    iter5.asp
    iter6.asp
    iter7.asp
    iter8.asp
    iter9.asp
    keys1.asp
    keys2.asp
    list-assign.asp
    literals.asp
    logical.asp
    loop0.asp
    loop1.asp
    loops.asp
    math-divide.asp
    math-modulo.asp
    math-neg-syntax.asp
    math.asp
    member.asp
    module1.asp
    module2.asp
    module3.asp
    module4.asp
    module5.asp
    module6.asp
    module7.asp
    module8.asp
    nan.asp
    power.asp
    print.asp
    range-basic.asp
    range-const.asp
    range-empty1.asp
    range-empty2.asp
    range-in.asp
    range-index.asp
    range-len.asp
    range-slice.asp
    #range-slice-big.asp # Output too big; occasionally compare with *.py.
    range-unbounded.asp
    #recursive-dict.asp
    #recursive-list.asp
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
    symbol1.asp
    symbol2.asp
    symbol3.asp
    symbol4.asp
    tuple-assign1.asp
    tuple-assign2.asp
    tuple-assign3.asp
    types.asp
    unary.asp
    while-else.asp
    while.asp
)

set(sample_app_regression_tests
    file.asp
    #file.asp+file-in.txt+file-out.txt
    rand.asp
    rand2.asp
    sort1.asp
    sort2.asp
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
