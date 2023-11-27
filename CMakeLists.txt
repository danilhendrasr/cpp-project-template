cmake_minimum_required(VERSION 3.27)

project(
    HelloWorld 
    VERSION 1.0.0 
    LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD          17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS        OFF)

option(ENABLE_TESTING "Enable testing" ON)
option(ENABLE_WARNINGS "Enable warnings" ON)
option(ENABLE_WARNINGS_AS_ERRORS "Enable warnings as errors" ON)

option(ENABLE_ADDRESS_SANITIZER "Enable address sanitizer" ON)
option(ENABLE_UNDEFINED_SANITIZER "Enable undefined sanitizer" ON)

set(LIBRARY_NAME    Library)
set(EXECUTABLE_NAME Executable)

set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
include(AddGitSubmodule)
include(FetchContent)

if(${ENABLE_WARNINGS})
    include(Warnings)
endif()

if(${ENABLE_ADDRESS_SANITIZER} OR ${ENABLE_UNDEFINED_SANITIZER})
    include(Sanitizers)
    add_sanitizer_flags()
endif()

FetchContent_Declare(
    nlohmann_json
    GIT_REPOSITORY  https://github.com/nlohmann/json
    GIT_TAG         v3.11.2
    GIT_SHALLOW     TRUE)
FetchContent_MakeAvailable(nlohmann_json)

FetchContent_Declare(
    spdlog
    GIT_REPOSITORY  https://github.com/gabime/spdlog
    GIT_TAG         v1.12.0
    GIT_SHALLOW     TRUE)
FetchContent_MakeAvailable(spdlog)

FetchContent_Declare(
    Catch2
    GIT_REPOSITORY  https://github.com/catchorg/Catch2
    GIT_TAG         v2.13.9
    GIT_SHALLOW     TRUE)
FetchContent_MakeAvailable(Catch2)

add_subdirectory(configured)
add_subdirectory(src)
add_subdirectory(app)
add_subdirectory(tests)