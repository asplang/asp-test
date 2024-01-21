# Helper function that creates failure test that expects certain output from the program
macro(add_failure_test test_script expected_error_line)
    get_filename_component(base_name "${test_script}" NAME_WE)
    compile_for_standalone("${test_script}" "${base_name}")
    list(APPEND compiled_test_scripts "${CMAKE_CURRENT_BINARY_DIR}/${base_name}.aspe")

    add_test(NAME "failure-${base_name}" COMMAND asps "${CMAKE_CURRENT_BINARY_DIR}/${base_name}.aspe")

    set_tests_properties("failure-${base_name}" PROPERTIES PASS_REGULAR_EXPRESSION ".*${expected_error_line}\n.*")
endmacro()


# Test scripts that should be run successfully
set(success_test_scripts
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
    keys.asp
    list-assign.asp
    logical.asp
    loop0.asp
    loop1.asp
    loops.asp
    math.asp
    member.asp
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

    recursive-dict.asp
    recursive-list.asp
)

set(compiled_test_scripts)
foreach(test_script ${success_test_scripts})
    get_filename_component(base_name "${test_script}" NAME_WE)
    compile_for_standalone(${test_script} ${base_name})
    list(APPEND compiled_test_scripts "${CMAKE_CURRENT_BINARY_DIR}/${base_name}.aspe")

    add_test(NAME ${base_name} COMMAND asps "${CMAKE_CURRENT_BINARY_DIR}/${base_name}.aspe")
endforeach()

add_failure_test(ins-nonmut.asp "Run error 0x0C: Unexpected type")
add_failure_test(ins-tuple.asp  "Run error 0x0C: Unexpected type")

add_custom_target(asp-compile-test-scripts ALL
    DEPENDS ${compiled_test_scripts}
)

