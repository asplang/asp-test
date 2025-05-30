add_custom_command(
    OUTPUT
        "${CMAKE_CURRENT_BINARY_DIR}/fuzz.aspec"
        "${CMAKE_CURRENT_BINARY_DIR}/fuzz.c"
        "${CMAKE_CURRENT_BINARY_DIR}/fuzz.h"
    DEPENDS
        aspg
        fuzz.asps
        "${ASP_SOURCE_DIR}/engine/type.asps"
        "${ASP_SOURCE_DIR}/engine/collect.asps"
        "${ASP_SOURCE_DIR}/engine/iter.asps"
        "${ASP_SOURCE_DIR}/engine/math.asps"
        "${ASP_SOURCE_DIR}/engine/sys.asps"
    COMMAND
        ${CMAKE_COMMAND} -E env
        "ASP_SPEC_INCLUDE=${PATH_NAME_SEPARATOR}${ASP_SOURCE_DIR}/engine"
        "$<TARGET_FILE:aspg>"
        "${CMAKE_CURRENT_SOURCE_DIR}/fuzz.asps"
    )


# Helper tool for reproducing crashes found by fuzzer without having to use fuzz binary itself
add_executable(bytecode-fuzz-crash-reproducer
    bytecode-fuzz-crash-reproducer.cpp

    "${CMAKE_CURRENT_BINARY_DIR}/fuzz.aspec"
    "${CMAKE_CURRENT_BINARY_DIR}/fuzz.c"
    "${CMAKE_CURRENT_BINARY_DIR}/fuzz.h"
	)

target_include_directories(bytecode-fuzz-crash-reproducer PRIVATE ${CMAKE_CURRENT_BINARY_DIR} "${ASP_BINARY_DIR}/engine")
target_link_libraries(bytecode-fuzz-crash-reproducer PRIVATE aspe aspm)

# Enable address sanitizer so that reproducer will catch all the same issues as the fuzzer
if (BUILD_FUZZ_TESTING)
	target_link_libraries(bytecode-fuzz-crash-reproducer PRIVATE asp-clang_sanitizers)
else()
	# Enable only address sanitizer
	target_link_libraries(bytecode-fuzz-crash-reproducer PRIVATE asp-enable_address_sanitizer)
endif()


add_subdirectory(bytecode-tests)


if (BUILD_FUZZ_TESTING)
    # Recompile aspe as part of the fuzz tester so that it is compiled with all the required compile and link flags
    get_target_property(aspe_src_list aspe SOURCES)
    get_target_property(aspm_src_list aspm SOURCES)
    get_target_property(aspe_include_paths aspe INCLUDE_DIRECTORIES)
    get_target_property(aspe_compile_definitions aspe COMPILE_DEFINITIONS)

    set(aspe_absolute_src_list)
    foreach(src_file ${aspe_src_list} ${aspm_src_list} )
        string(FIND "${src_file}" debug.c is_debug_src)
        if(is_debug_src GREATER_EQUAL 0)
            continue()
        endif()
        if (IS_ABSOLUTE "${src_file}")
            list(APPEND aspe_absolute_src_list "${src_file}")
        else()
            list(APPEND aspe_absolute_src_list "${ASP_SOURCE_DIR}/engine/${src_file}")
        endif()
    endforeach()


    add_executable(bytecode-fuzz-test
        bytecode-fuzz-test.cpp

        "${CMAKE_CURRENT_BINARY_DIR}/fuzz.aspec"
        "${CMAKE_CURRENT_BINARY_DIR}/fuzz.c"
        "${CMAKE_CURRENT_BINARY_DIR}/fuzz.h"

        ${aspe_absolute_src_list}
    )

    target_include_directories(bytecode-fuzz-test PRIVATE ${CMAKE_CURRENT_BINARY_DIR} ${aspe_include_paths})
    target_link_libraries(bytecode-fuzz-test PRIVATE asp-clang_fuzzer)

    # Make sure that ASP_DEBUG isn't defined for fuzz testing
    list(FILTER aspe_compile_definitions EXCLUDE REGEX [[:ASP_DEBUG>$]])
    target_compile_definitions(bytecode-fuzz-test PRIVATE ${aspe_compile_definitions})
endif()
