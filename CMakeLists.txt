cmake_minimum_required(VERSION 3.10)

if (CMAKE_VERSION VERSION_GREATER_EQUAL "3.15")
    # Set MSVC runtime library type from MSVC_RUNTIME_LIBRARY target property
    cmake_policy(SET CMP0091 NEW)
endif()

project(asp-test VERSION 0.0.1)

set(ASP_SOURCE_DIR "" CACHE PATH "Path to asp repository that is used to run tests")

if (NOT EXISTS "${ASP_SOURCE_DIR}/CMakeLists.txt")
    message(FATAL_ERROR "ASP_SOURCE_DIR must be specified and point to cloned asp source repository")
endif()

option(ENABLE_ADDRESS_SANITIZER "Enable address sanitizer" ON)
option(BUILD_FUZZ_TESTING "Build fuzz testing target" OFF)

if (BUILD_FUZZ_TESTING)
    if (NOT (CMAKE_CXX_COMPILER_ID STREQUAL "Clang"))
        message(FATAL_ERROR "BUILD_FUZZ_TESTING can only be enabled when building with clang")
    endif()
    if (BUILD_FUZZ_TESTING AND NOT ENABLE_ADDRESS_SANITIZER)
        set(ENABLE_ADDRESS_SANITIZER ON)
    endif()
endif()
if (ENABLE_ADDRESS_SANITIZER)
    if (MSVC AND (CMAKE_VERSION VERSION_GREATER_EQUAL "3.15"))
        if (("${CMAKE_MSVC_RUNTIME_LIBRARY}" STREQUAL "") OR (CMAKE_MSVC_RUNTIME_LIBRARY MATCHES "(Debug|DLL)$"))
            set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded" CACHE STRING "MSVC runtime library type" FORCE)
            message(WARNING "Setting CMAKE_MSVC_RUNTIME_LIBRARY=\"MultiThreaded\" to use static release libraries to allow building with -fsanitize=address. Value was \"${CMAKE_MSVC_RUNTIME_LIBRARY}\"")
        endif()
    endif()
endif()

if (MSVC)
    add_compile_options(/D_CRT_SECURE_NO_WARNINGS)
    if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
        # Unsupported option when using clang-cl
        add_compile_options(/Zc:preprocessor)
    endif()
endif()

include(cmake/sanitizers.cmake)

set(BUILD_FOR_TARGET ON CACHE INTERNAL "Force building target libs")
set(BUILD_FOR_HOST ON CACHE INTERNAL "Force building host libs")
set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "Disable building shared libs")
set(ENABLE_ASPS_DEBUG ON CACHE INTERNAL "Force enable asps debug data for comparing internal state in regression tests")
add_subdirectory("${ASP_SOURCE_DIR}" asp-build)
set(ASP_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/asp-build")

enable_testing()

add_subdirectory(scripts)
add_subdirectory(fuzzing)
