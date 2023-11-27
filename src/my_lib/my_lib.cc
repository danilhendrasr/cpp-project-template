#include <iostream>
#include <memory>

#include <spdlog/spdlog.h>
#include <nlohmann/json.hpp>
#include <catch2/catch.hpp>

#include "my_lib.h"

void print_hello_world() {
    std::cout << "Hello, world!" << std::endl;

    std::cout << "JSON lib version: "
        << NLOHMANN_JSON_VERSION_MAJOR << "."
        << NLOHMANN_JSON_VERSION_MINOR << "."
        << NLOHMANN_JSON_VERSION_PATCH << std::endl;

    std::cout << "SPD Log version: "
        << SPDLOG_VER_MAJOR << "."
        << SPDLOG_VER_MINOR << "."
        << SPDLOG_VER_PATCH << std::endl;

    std::cout << "Catch2 version: "
        << CATCH_VERSION_MAJOR << "."
        << CATCH_VERSION_MINOR << "."
        << CATCH_VERSION_PATCH << std::endl;

    std::shared_ptr<int> ptr = std::make_shared<int>(42);
    std::unique_ptr<int> ptr2 = std::make_unique<int>(42);

    std::cout << *ptr + *ptr2 << std::endl;
}

std::uint32_t factorial(std::uint32_t number) {
    return number <= 1 ? number : factorial(number - 1) * number;
}