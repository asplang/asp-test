# Linking to this target will enable address sanitizer when ENABLE_ADDRESS_SANITIZER=ON
add_library(asp-enable_address_sanitizer INTERFACE)

if (ENABLE_ADDRESS_SANITIZER)
    if (WIN32)
        if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
            get_filename_component(clang_executable_dir ${CMAKE_CXX_COMPILER} DIRECTORY)
            set(clang_executable_path "${clang_executable_dir}/clang.exe")

            execute_process(COMMAND ${clang_executable_path} -print-search-dirs
                OUTPUT_VARIABLE clang_print_search_dirs_out
                ERROR_VARIABLE clang_print_search_dirs_error
                OUTPUT_STRIP_TRAILING_WHITESPACE
                RESULTS_VARIABLE clang_print_search_dirs_result
            )

            if(NOT clang_print_search_dirs_result EQUAL 0)
                message(WARNING "Unable to locate Clang Search Directories: ${clang_print_search_dirs_result}")
            endif()

            string(REGEX MATCH "libraries: =(.+)" _MATCH "${clang_print_search_dirs_out}")
            set(clang_libraries_dir ${CMAKE_MATCH_1})
    
            function(find_clang_library var_out library_name)
                find_library("_${var_out}" ${library_name}
                    HINTS ${clang_libraries_dir}
                    PATH_SUFFIXES "lib/windows"
                    NO_DEFAULT_PATH
                )
                set(${var_out} ${_${var_out}} PARENT_SCOPE)
            endfunction()

            find_clang_library(clang_rt_asan_preinit "clang_rt.asan-preinit-x86_64")
            find_clang_library(clang_rt_asan         "clang_rt.asan-x86_64")
            find_clang_library(clang_rt_asan_cxx     "clang_rt.asan_cxx-x86_64")
            find_clang_library(clang_rt_fuzzer       "clang_rt.fuzzer-x86_64")

            target_compile_options(asp-enable_address_sanitizer INTERFACE -fsanitize=address)
            target_link_libraries(asp-enable_address_sanitizer INTERFACE
                "${clang_rt_asan_preinit}"
                "${clang_rt_asan}"
                "${clang_rt_asan_cxx}"
            )
        else()
            target_compile_options(asp-enable_address_sanitizer INTERFACE -fsanitize=address)
            target_link_libraries(asp-enable_address_sanitizer INTERFACE -fsanitize=address)
        endif()
    else()
        target_compile_options(asp-enable_address_sanitizer INTERFACE -fsanitize=address)
        target_link_options(asp-enable_address_sanitizer INTERFACE -fsanitize=address)
    endif()
endif()


# Fuzzing support
if(BUILD_FUZZ_TESTING)
    if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
        add_library(asp-clang_fuzzer INTERFACE)
        add_library(asp-clang_sanitizers INTERFACE)
        if (WIN32)
            if(clang_rt_asan_preinit AND clang_rt_asan AND clang_rt_asan_cxx AND clang_rt_fuzzer)
                if (NOT(CMAKE_MSVC_RUNTIME_LIBRARY STREQUAL "MultiThreaded"))
                    message(FATAL_ERROR "Cannot enable fuzzing. All dependencies were found but clang libfuzzer only works with statically linked release MSVC runtime library. Set CMAKE_MSVC_RUNTIME_LIBRARY to \"MultiThreaded\"")
                endif()

            else()
                message(FATAL_ERROR "Cannot enable fuzzing. Dependencies not found. Ensure a recent version of Clang is available.")
            endif()

            target_link_libraries(asp-clang_fuzzer INTERFACE
                "${clang_rt_asan_preinit}"
                "${clang_rt_asan}"
                "${clang_rt_asan_cxx}"
                "${clang_rt_fuzzer}"
            )
            target_compile_options(asp-clang_fuzzer INTERFACE
                -fsanitize=fuzzer,address)

            target_compile_options(asp-clang_sanitizers INTERFACE
                -fsanitize=address)
            target_link_libraries(asp-clang_sanitizers INTERFACE
                "${clang_rt_asan_preinit}"
                "${clang_rt_asan}"
                "${clang_rt_asan_cxx}"
                )
        else()
            target_compile_options(asp-clang_fuzzer INTERFACE -fsanitize=fuzzer,address,undefined)
            target_link_options(asp-clang_fuzzer INTERFACE -fsanitize=fuzzer,address,undefined)
            target_compile_options(asp-clang_sanitizers INTERFACE -fsanitize=address,undefined)
            target_link_options(asp-clang_sanitizers INTERFACE -fsanitize=address,undefined)
        endif()

    else()
        message(WARNING "Fuzz testing is only available when building with clang")
    endif()
endif()
