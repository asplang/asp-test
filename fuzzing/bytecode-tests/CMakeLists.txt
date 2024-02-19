set(test_files
    timeout-symbol-tree-corruption
    timeout-symbol-tree-corruption2
    timeout-del
    crash-S-format-specifier
    crash-indexed-format-specifier  # Crash when $ is used to refer argument by index
    crash-del-set
    
    timeout-assign-sequence
    timeout-assign-sequence2
    timeout-tree-erase-getlimitnode
    timeout-tree-erase-getlimitnode2
    
    crash-recursive-deleted-insert
    crash-make-range-and-index
    
    timeout-AspLib_next-symbol-tree-corrupt
    timeout-AspLib_next-symbol-tree-corrupt2

    timeout-long-float-format
    timeout-nan-subnormal
    crash-erase

    crash-expand-range-with-large-step
)

foreach(test_data ${test_files})
    add_test(NAME "bytecode-test-${test_data}" COMMAND bytecode-fuzz-crash-reproducer "${CMAKE_CURRENT_SOURCE_DIR}/${test_data}")
    set_tests_properties("bytecode-test-${test_data}" PROPERTIES TIMEOUT 3)
endforeach()
