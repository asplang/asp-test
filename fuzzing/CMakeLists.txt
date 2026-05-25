project(fuzzing)

add_custom_command(
    OUTPUT
        "${CMAKE_CURRENT_BINARY_DIR}/fuzz.aspec"
        "${CMAKE_CURRENT_BINARY_DIR}/fuzz.c"
        "${CMAKE_CURRENT_BINARY_DIR}/fuzz.h"
    DEPENDS
        fuzz.asps
        "${ASP_SOURCE_DIR}/engine/type.asps"
        "${ASP_SOURCE_DIR}/engine/collect.asps"
        "${ASP_SOURCE_DIR}/engine/iter.asps"
        "${ASP_SOURCE_DIR}/engine/math.asps"
        "${ASP_SOURCE_DIR}/engine/sys.asps"
    COMMAND
        ${CMAKE_COMMAND} -E env
        "ASP_SPEC_INCLUDE=${PROJECT_SOURCE_DIR}:${ASP_SOURCE_DIR}/engine"
        "$<TARGET_FILE:aspg>"
        "${PROJECT_SOURCE_DIR}/fuzz.asps"
    )

if(ENABLE_FEATURE_CLASS)
    add_custom_command(
        OUTPUT
            "${CMAKE_CURRENT_BINARY_DIR}/fuzz-oo.aspec"
            "${CMAKE_CURRENT_BINARY_DIR}/fuzz-oo.c"
            "${CMAKE_CURRENT_BINARY_DIR}/fuzz-oo.h"
        DEPENDS
            fuzz-oo.asps
            "${ASP_SOURCE_DIR}/engine/type.asps"
            "${ASP_SOURCE_DIR}/engine/collect.asps"
            "${ASP_SOURCE_DIR}/engine/iter.asps"
            "${ASP_SOURCE_DIR}/engine/math.asps"
            "${ASP_SOURCE_DIR}/engine/sys.asps"
            "${ASP_SOURCE_DIR}/engine/class.asps"
        COMMAND
            ${CMAKE_COMMAND} -E env
            "ASP_SPEC_INCLUDE=${PROJECT_SOURCE_DIR}:${ASP_SOURCE_DIR}/engine"
            "$<TARGET_FILE:aspg>"
            "${PROJECT_SOURCE_DIR}/fuzz-oo.asps"
        )
endif()

# Helper tool for reproducing crashes found by fuzzer without having to use
# fuzz binary itself.
add_executable(bytecode-fuzz-crash-reproducer
    bytecode-fuzz-crash-reproducer.cpp
    fuzz.c
)

target_include_directories(bytecode-fuzz-crash-reproducer PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}
    "${ASP_BINARY_DIR}/engine"
)

target_link_libraries(bytecode-fuzz-crash-reproducer PRIVATE
    aspe
    aspm
)

if(ENABLE_FEATURE_CLASS)

    # Class support version of helper tool for reproducing crashes found by
    # fuzzer without having to use fuzz binary itself.
    add_executable(bytecode-fuzz-crash-reproducer-oo
        bytecode-fuzz-crash-reproducer.cpp
        fuzz-oo.c
    )

    target_compile_definitions(bytecode-fuzz-crash-reproducer-oo PRIVATE
        ASP_FEATURE_CLASS
    )

    target_include_directories(bytecode-fuzz-crash-reproducer-oo PRIVATE
        ${CMAKE_CURRENT_BINARY_DIR}
        "${ASP_BINARY_DIR}/engine"
    )

    target_link_libraries(bytecode-fuzz-crash-reproducer-oo PRIVATE
        aspe-oo
        aspm
    )

endif()

# Enable address sanitizer so that reproducer will catch all the same issues as
# the fuzzer.
if (BUILD_FUZZ_TESTING)
    target_link_libraries(bytecode-fuzz-crash-reproducer PRIVATE
        asp-clang_sanitizers
    )
else()
    # Enable only address sanitizer
    target_link_libraries(bytecode-fuzz-crash-reproducer PRIVATE
        asp-enable_address_sanitizer
    )
endif()

add_subdirectory(bytecode-tests)

if (BUILD_FUZZ_TESTING)

    # Recompile aspe as part of the fuzz tester so that it is compiled with all
    # the required compile and link flags.
    get_target_property(aspe_src_list aspe SOURCES)
    get_target_property(aspm_src_list aspm SOURCES)
    get_target_property(aspe_include_paths aspe INCLUDE_DIRECTORIES)
    get_target_property(aspe_compile_definitions aspe COMPILE_DEFINITIONS)

    # Make sure that ASP_DEBUG isn't defined for fuzz testing.
    list(FILTER aspe_compile_definitions EXCLUDE REGEX [[:ASP_DEBUG>$]])

    set(aspe_absolute_src_list)
    foreach(src_file ${aspe_src_list} ${aspm_src_list})
        string(FIND "${src_file}" debug.c is_debug_src)
        if(is_debug_src GREATER_EQUAL 0)
            continue()
        endif()
        if (IS_ABSOLUTE "${src_file}")
            list(APPEND aspe_absolute_src_list "${src_file}")
        else()
            list(APPEND aspe_absolute_src_list
                "${ASP_SOURCE_DIR}/engine/${src_file}"
            )
        endif()
    endforeach()

    add_executable(bytecode-fuzz-test
        bytecode-fuzz-test.cpp
        fuzz.c
        ${aspe_absolute_src_list}
    )

    target_include_directories(bytecode-fuzz-test PRIVATE
        ${CMAKE_CURRENT_BINARY_DIR}
        ${aspe_include_paths}
    )

    target_link_libraries(bytecode-fuzz-test PRIVATE
        asp-clang_fuzzer
    )

    target_compile_definitions(bytecode-fuzz-test PRIVATE
        ${aspe_compile_definitions}
    )

    if(ENABLE_FEATURE_CLASS)

        # Recompile aspe-oo as part of the fuzz tester so that it is compiled
        # with all the required compile and link flags.
        get_target_property(aspe_oo_src_list aspe-oo SOURCES)
        get_target_property(aspe_oo_compile_definitions aspe-oo COMPILE_DEFINITIONS)

        # Make sure that ASP_DEBUG isn't defined for fuzz testing.
        list(FILTER aspe_oo_compile_definitions EXCLUDE REGEX [[:ASP_DEBUG>$]])

        set(aspe_oo_absolute_src_list)
        foreach(src_file ${aspe_oo_src_list} ${aspm_src_list})
            string(FIND "${src_file}" debug.c is_debug_src)
            if(is_debug_src GREATER_EQUAL 0)
                continue()
            endif()
            if (IS_ABSOLUTE "${src_file}")
                list(APPEND aspe_oo_absolute_src_list "${src_file}")
            else()
                list(APPEND aspe_oo_absolute_src_list
                    "${ASP_SOURCE_DIR}/engine/${src_file}"
                )
            endif()
        endforeach()

        add_executable(bytecode-fuzz-test-oo
            bytecode-fuzz-test.cpp
            fuzz-oo.c
            ${aspe_oo_absolute_src_list}
        )

        target_include_directories(bytecode-fuzz-test-oo PRIVATE
            ${CMAKE_CURRENT_BINARY_DIR}
            ${aspe_include_paths}
        )

        target_link_libraries(bytecode-fuzz-test-oo PRIVATE
            asp-clang_fuzzer
        )

        target_compile_definitions(bytecode-fuzz-test-oo PRIVATE
            ${aspe_oo_compile_definitions}
        )

    endif()

endif()
