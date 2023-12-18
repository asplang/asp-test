
function(compile_for_standalone source output_base_name)
    if (NOT IS_ABSOLUTE "${source}")
        set(source "${CMAKE_CURRENT_SOURCE_DIR}/${source}")
    endif()
    if (NOT IS_ABSOLUTE "${output_base_name}")
        set(output_base_name "${CMAKE_CURRENT_BINARY_DIR}/${output_base_name}")
    endif()
    
    add_custom_command(
        OUTPUT
            "${output_base_name}.aspe"
            "${output_base_name}.aspd"
            "${output_base_name}.lst"
        COMMAND aspc -o "${output_base_name}" "${ASP_BINARY_DIR}/standalone/standalone.aspec" "${source}"
        DEPENDS "${ASP_BINARY_DIR}/standalone/standalone.aspec" "${source}" aspc
    )
endfunction()

add_subdirectory(demo)
add_subdirectory(tests)
