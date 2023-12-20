#
# Sample Asp application build specification.
#

cmake_minimum_required(VERSION 3.5)

project(sample VERSION 1.0)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

if(WIN32)
    set(C_COMMAND_OPTION_PREFIXES [["-/"]])
    add_compile_options(/D_CRT_SECURE_NO_WARNINGS /Zc:preprocessor)
else()
    set(C_COMMAND_OPTION_PREFIXES [["-"]])
endif()

add_custom_command(
    OUTPUT
        "${PROJECT_BINARY_DIR}/sample.aspec"
        "${PROJECT_BINARY_DIR}/sample.c"
        "${PROJECT_BINARY_DIR}/sample.h"
    DEPENDS
        "${PROJECT_SOURCE_DIR}/sample.asps"
    COMMAND
        ${CMAKE_COMMAND} -E env
        "ASP_SPEC_INCLUDE=${CMAKE_INSTALL_PREFIX}/include/asps"
        aspg "${PROJECT_SOURCE_DIR}/sample.asps"
    )

add_executable(sample
    main.cpp
    sample.c
    scripting.cpp
    functions.cpp
    functions-file.cpp
    functions-print.cpp
    functions-random.cpp
    functions-sleep.cpp
    )

target_link_libraries(sample
    aspe
    aspd
    )

target_compile_definitions(sample PRIVATE
    $<$<NOT:$<STREQUAL:${C_COMMAND_OPTION_PREFIXES},>>:
        COMMAND_OPTION_PREFIXES=${C_COMMAND_OPTION_PREFIXES}>
    )

target_include_directories(sample PRIVATE
    "${PROJECT_BINARY_DIR}"
    "${PROJECT_SOURCE_DIR}"
    )
