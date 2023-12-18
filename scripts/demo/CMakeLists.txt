
compile_for_standalone(demo.asp demo)
add_custom_target(asp-compile-demo ALL
    DEPENDS "${CMAKE_CURRENT_BINARY_DIR}/demo.aspe"
)
