function(add_sanitizer_flags)
    if(NOT ${ENABLE_ADDRESS_SANITIZER} AND NOT ${ENABLE_UNDEFINED_SANITIZER})
        message(STATUS "Sanitizer flags not enabled")
        return()
    endif()

    if(CMAKE_CXX_COMPILER_ID MATCHES "CLANG" 
        OR CMAKE_CXX_COMPILER_ID MATCHES "AppleClang"
        OR CMAKE_CXX_COMPILER_ID MATCHES "GNU")

        add_compile_options("-fno-omit-frame-pointer")
        add_link_options("-fno-omit-frame-pointer")

        if(${ENABLE_ADDRESS_SANITIZER})
            add_compile_options("-fsanitize=address")
            add_link_options("-fsanitize=address")
        endif()

        if(${ENABLE_UNDEFINED_SANITIZER})
            add_compile_options("-fsanitize=undefined")
            add_link_options("-fsanitize=undefined")
        endif()
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
        if(${ENABLE_ADDRESS_SANITIZER})
            add_compile_options("/fsanitize=address")
        endif()

        if(${ENABLE_UNDEFINED_SANITIZER})
            message(STATUS "Undefined sanitizer not supported on MSVC")
        endif()
    else()
        message(STATUS "${CMAKE_CXX_COMPILER_ID} doesn't support sanitizers")
    endif()
endfunction(add_sanitizer_flags)