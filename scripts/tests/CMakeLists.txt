# Test cases.

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
    aug-undef-glob1.asp
    aug-undef-glob2.asp
    aug-undef-loc.asp
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
    bad-assign-value01.asp
    bad-assign-value02.asp
    bad-assign-value03.asp
    bad-assign-value04.asp
    bad-aug-call.asp
    bad-aug-const.asp
    bad-aug-list.asp
    bad-aug-range.asp
    bad-aug-tuple.asp
    bad-aug-value1.asp
    bad-aug-value2.asp
    bad-aug-value3.asp
    bad-call1.asp
    bad-call2.asp
    bad-call3.asp
    bad-call4.asp
    bad-call5.asp
    bad-const1.asp
    bad-const2.asp
    bad-decor1.asp
    bad-decor2.asp
    bad-decor3.asp
    bad-decor4.asp
    bad-decor5.asp
    bad-decor6.asp
    bad-decor7.asp
    bad-decor8.asp
    bad-decor9.asp
    bad-del1.asp
    bad-del2.asp
    bad-del3.asp
    bad-del4.asp
    bad-del5.asp
    bad-del6.asp
    bad-for01.asp
    bad-for02.asp
    bad-for03.asp
    bad-for04.asp
    bad-for05.asp
    bad-for06.asp
    bad-for07.asp
    bad-for08.asp
    bad-for09.asp
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
    bad-import.asp
    bad-indent1.asp
    bad-indent2.asp
    bad-indent3.asp
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
    bad-statement1.asp
    bad-statement2.asp
    bad-statement3.asp
    bad-statement4.asp
    bad-statement5.asp
    bad-statement6.asp
    bad-statement7.asp
    bad-type1.asp
    bad-type2.asp
    bad-type3.asp
    bad-walrus-assign-target01.asp
    bad-walrus-assign-target02.asp
    bad-walrus-assign-target03.asp
    bad-walrus-assign-target04.asp
    bad-walrus-assign-target05.asp
    bad-walrus-assign-target06.asp
    bad-walrus-assign-target07.asp
    bad-walrus-assign-target08.asp
    bad-walrus-assign-target09.asp
    bad-walrus-assign-target10.asp
    bad-walrus-assign-target11.asp
    bad-walrus-assign-target12.asp
    bad-walrus-assign-value1.asp
    bad-walrus-assign-value2.asp
    bad-walrus-assign-value3.asp
    bad-walrus-assoc.asp
    bad-walrus-call1.asp
    bad-walrus-call2.asp
    bad-walrus-del1.asp
    bad-walrus-del2.asp
    bad-walrus-del3.asp
    bad-walrus-del4.asp
    bad-walrus-del5.asp
    bad-walrus-for-target1.asp
    bad-walrus-for-target2.asp
    bad-walrus-func1.asp
    bad-walrus-func2.asp
    bad-walrus-global1.asp
    bad-walrus-global2.asp
    bad-walrus-import1.asp
    bad-walrus-import2.asp
    bad-walrus-import3.asp
    bad-walrus-insert-target1.asp
    bad-walrus-insert-target2.asp
    bad-walrus-insert-target3.asp
    bad-walrus-insert-target4.asp
    bad-walrus-local1.asp
    bad-walrus-local2.asp
    bad-walrus-prec1.asp
    bad-walrus-prec2.asp
    bad-walrus-prec3.asp
    bad-walrus-prec4.asp
    bad-walrus-prec5.asp
    bad-walrus-prec6.asp
    bad-walrus-statement1.asp
    bad-walrus-statement2.asp
    bad-walrus-statement3.asp
    bad-walrus-syntax1.asp
    bad-walrus-syntax2.asp
    bad-walrus-syntax3.asp
    bad-walrus-syntax4.asp
    bad-walrus-syntax5.asp
    bad-walrus-target1.asp
    bad-walrus-target2.asp
    bif.asp
    bitwise.asp
    comment.asp
    concat.asp
    conditional.asp
    cycle1.asp
    cycle2.asp
    cycle3.asp
    del-element.asp
    del-member.asp
    dict-del.asp
    empty.asp
    equal.asp
    erase-list.asp
    exit-0.asp
    exit-False.asp
    exit-None.asp
    exit-True.asp
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
    eval-order-assign1.asp
    eval-order-assign2.asp
    eval-order-aug1.asp
    eval-order-aug2.asp
    eval-order-call.asp
    eval-order-del.asp
    eval-order-dict.asp
    eval-order-index.asp
    eval-order-insert.asp
    eval-order-range.asp
    fib.asp+10
    fill-empty.asp
    fill-empty.asp+abc+z+pqrs
    folding.asp
    for-dict.asp
    for-module.asp
    for-return1.asp
    for-return2.asp
    for-return3.asp
    for-targets1.asp
    for-targets2.asp
    for-targets3.asp
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
    insert-dict.asp
    insert-iter1.asp
    insert-iter2.asp
    insert-iter3.asp
    insert-list1.asp
    insert-list2.asp
    insert-nonmut.asp
    insert-range1.asp
    insert-range2.asp
    insert-range3.asp
    insert-set.asp
    insert-str.asp
    insert-tuple.asp
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
    module-members1.asp
    module-members2.asp
    module-members3.asp
    nan.asp
    object-members1.asp
    object-members2.asp
    object-members3.asp+0
    object-members3.asp+1
    object-members4.asp
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
    semicolon1.asp
    semicolon2.asp
    semicolon3.asp
    semicolon4.asp
    semicolon5.asp
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
    walrus-assert.asp
    walrus-assign.asp
    walrus-call.asp
    walrus-dict.asp
    walrus-discouraged.asp
    walrus-if-else.asp
    walrus-if.asp
    walrus-index.asp
    walrus-insert.asp
    walrus-list.asp
    walrus-param-default.asp
    walrus-return.asp
    walrus-set.asp
    walrus-short-circuit.asp
    walrus-subexpr.asp
    walrus-tuple.asp
    walrus-while.asp
    while-else.asp
    while.asp
)

if(NOT ENABLE_FEATURE_CLASS)

    list(APPEND standalone_regression_tests
        class.asp
        )

else()

    list(APPEND standalone_regression_tests
        class-empty.asp
        )

    set(standalone_oo_regression_tests
        bad-class-base-0.asp
        bad-class-base-None.asp
        bad-class-base-group1.asp
        bad-class-base-group2.asp
        bad-class-base-named.asp
        bad-class-multi.asp
        bad-class-return1.asp
        bad-class-return2.asp
        bif-class.asp
        class-aug.asp
        class-base-expr.asp
        class-empty.asp
        class-leak.asp
        class-members1.asp
        class-members2.asp
        class-members3.asp
        decor-class.asp
        decor-custom.asp
        decor-order.asp
        decor-std.asp
        decor-syntax.asp
        del-class1.asp
        del-class2.asp
        del-class3.asp
        del-class4.asp
        del-class5.asp
        index-class.asp
        insert-class.asp
        instance-aug1.asp
        instance-aug2.asp
        instance-members1.asp
        instance-members2.asp
        instance-members3.asp
        instance-shadow1.asp
        instance-shadow2.asp
        instance-shadow3.asp
        isinstance1.asp
        isinstance2.asp
        isinstance3.asp
        issubclass1.asp
        issubclass2.asp
        issubclass3.asp
        iter1-class.asp
        polynomial.asp
        relop-class.asp
        relop-instance.asp
        relop-method.asp
        super1.asp
        super2.asp
        super3.asp
        super4.asp
        super5.asp
        super6.asp
        super7.asp
        super-members.asp
    )

endif()

# Copy the test file required for the sample app file test.
configure_file(test-file.txt test-file.txt COPYONLY)

set(sample_app_regression_tests
    file.asp
    file.asp+test-file.txt # Requires test-file.txt to exist
    rand.asp
    rand2.asp
    sort1.asp
    sort2.asp
)

# This directory must not contain any other data as it is destroyed and
# recreated when regression data is generated.
set(TEST_REFERENCE_DATA_DIR
    "${CMAKE_CURRENT_SOURCE_DIR}/regression-data"
    CACHE PATH
    "Directory containing reference output data for regression tests"
)

add_custom_target(clean-test-reference-data
    COMMAND ${CMAKE_COMMAND} -E rm -Rf "${TEST_REFERENCE_DATA_DIR}"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${TEST_REFERENCE_DATA_DIR}"
)

# Make sure that we have a directory ready for the test output
file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/regression-data")

set(generate_test_data_targets)

function(define_tests test_name_prefix aspec_file script_dir asps_executable)
    set(local_generate_test_data_targets)
    foreach(test_spec ${ARGN})
        parse_test_spec("${test_spec}" test_name test_script test_args)
        if(test_name_prefix)
            set(test_name ${test_name_prefix}-${test_name})
        endif()

        add_test(NAME ${test_name}
            COMMAND ${CMAKE_COMMAND}
                -D "TEST_NAME=${test_name}"
                -D "TEST_ARGS=${test_args}"
                -D "ASPC_EXECUTABLE=$<TARGET_FILE:aspc>"
                -D "ASPEC_FILE=${aspec_file}"
                -D "SOURCE_FILE=${script_dir}/${test_script}"
                -D "ASPS_EXECUTABLE=${asps_executable}"
                -D "BYTECODE_FILE=${CMAKE_CURRENT_BINARY_DIR}/${test_name}.aspe"
                -D "OUTPUT_DIR=${CMAKE_CURRENT_BINARY_DIR}/regression-data"
                -D "REFERENCE_DIR=${TEST_REFERENCE_DATA_DIR}"
                -P "${CMAKE_CURRENT_SOURCE_DIR}/run_test.cmake"
            VERBATIM
        )

        # Custom target that saves all its output to the
        # TEST_REFERENCE_DATA_DIR directory.
        add_custom_target(generate-test-reference-data-${test_name}
            COMMAND ${CMAKE_COMMAND}
                -D "TEST_NAME=${test_name}"
                -D "TEST_ARGS=${test_args}"
                -D "ASPC_EXECUTABLE=$<TARGET_FILE:aspc>"
                -D "ASPEC_FILE=${aspec_file}"
                -D "SOURCE_FILE=${script_dir}/${test_script}"
                -D "ASPS_EXECUTABLE=${asps_executable}"
                -D "BYTECODE_FILE=${CMAKE_CURRENT_BINARY_DIR}/${test_name}.aspe"
                -D "OUTPUT_DIR=${TEST_REFERENCE_DATA_DIR}"
                -P "${CMAKE_CURRENT_SOURCE_DIR}/run_test.cmake"
            DEPENDS "${script_dir}/${test_script}"
            VERBATIM
        )
        add_dependencies(generate-test-reference-data-${test_name}
            clean-test-reference-data)
        list(APPEND local_generate_test_data_targets
            generate-test-reference-data-${test_name})
    endforeach()
    set(generate_test_data_targets "${generate_test_data_targets}"
        "${local_generate_test_data_targets}" PARENT_SCOPE)
endfunction()

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

define_tests(
    ""
    "${ASP_BINARY_DIR}/standalone/standalone.aspec"
    "${CMAKE_CURRENT_SOURCE_DIR}"
    "$<TARGET_FILE:asps>"
    ${standalone_regression_tests}
)

if(ENABLE_FEATURE_CLASS)
    define_tests(
        oo
        "${ASP_BINARY_DIR}/standalone/standalone-oo.aspec"
        "${CMAKE_CURRENT_SOURCE_DIR}"
        "$<TARGET_FILE:asps>"
        ${standalone_oo_regression_tests}
    )
endif()

define_tests(
    sample-app
    "${sample_BINARY_DIR}/sample.aspec"
    "${sample_SOURCE_DIR}/scripts"
    "$<TARGET_FILE:sample>"
    ${sample_app_regression_tests}
)

add_custom_target(generate-test-reference-data)
add_dependencies(generate-test-reference-data ${generate_test_data_targets})
