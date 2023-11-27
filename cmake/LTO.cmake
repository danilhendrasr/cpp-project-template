function(target_enable_lto TARGET)
    include(CheckIPOSupported)
    check_ipo_supported(RESULT result OUTPUT output)

    if(result)
        message(STATUS "IPO/LTO enabled for ${TARGET}")
        set_property(TARGET ${TARGET} PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
    else()
        message(STATUS "Failed enabling IPO/LTO for ${TARGET}, IPO/LTO not supported: <${output}>")
    endif()
endfunction(target_enable_lto)