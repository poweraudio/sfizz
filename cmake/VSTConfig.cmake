set (VSTPLUGIN_NAME            "sfizz")
set (VSTPLUGIN_VENDOR          "Paul Ferrand")
set (VSTPLUGIN_URL             "http://sfztools.github.io/sfizz")
set (VSTPLUGIN_EMAIL           "paul@ferrand.cc")

# --- VST3 Bundle architecture ---
if(NOT VST3_PACKAGE_ARCHITECTURE)
    if(APPLE)
        # VST3 packages are universal on Apple, architecture string not needed
    else()
        if(CMAKE_SYSTEM_PROCESSOR MATCHES "^(x86_64|amd64|AMD64)$")
            set(VST3_PACKAGE_ARCHITECTURE "x86_64")
        elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86)$")
            if(WIN32)
                set(VST3_PACKAGE_ARCHITECTURE "x86")
            else()
                set(VST3_PACKAGE_ARCHITECTURE "i386")
            endif()
        else()
            message(FATAL_ERROR "We don't know this architecture for VST3: ${CMAKE_SYSTEM_PROCESSOR}.")
        endif()
    endif()
endif()
