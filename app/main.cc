#include "config.hpp"
#include "my_lib.h"
#include <iostream>
#include <nlohmann/json.hpp>

int main() {
  print_hello_world();

  std::cout << "Project name: " << project_name << std::endl;
  std::cout << "Project version: " << project_version << std::endl;

  std::cout << "JSON lib version: " << NLOHMANN_JSON_VERSION_MAJOR << "."
            << NLOHMANN_JSON_VERSION_MINOR << "." << NLOHMANN_JSON_VERSION_PATCH
            << std::endl;

  return 0;
}