function(target_enable_lto)
    set(oneValueArgs TARGET ENABLE)
    cmake_parse_arguments(
        LTO
        "${options}"
        "${oneValueArgs}"
        "${multiValueArgs}"
        ${ARGN})

    include(CheckIPOSupported)
    check_ipo_supported(RESULT result OUTPUT output)

    if(result)
        message(STATUS "IPO/LTO enabled for ${LTO_TARGET}")
        set_property(TARGET ${LTO_TARGET} PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
    else()
        message(STATUS "Failed enabling IPO/LTO for ${LTO_TARGET}, IPO/LTO not supported: <${output}>")
    endif()
endfunction(target_enable_lto)
