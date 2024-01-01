set(test_files
    timeout-symbol-tree-corruption
    timeout-symbol-tree-corruption2
    timeout-del
    crash-S-format-specifier
    crash-$-format-specifier
    crash-del-set
)

foreach(test_data ${test_files})
    add_test(NAME "bytecode-test-${test_data}" COMMAND bytecode-fuzz-crash-reproducer "${CMAKE_CURRENT_SOURCE_DIR}/${test_data}")
endforeach()
