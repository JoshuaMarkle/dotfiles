cmake_minimum_required(VERSION 3.19)
project(Gaps VERSION "0.1")
set(CMAKE_CXX_STANDARD 23)
add_compile_definitions(WLR_USE_UNSTABLE)
add_compile_options(-Wall -Wextra -Wno-unused-parameter -Wno-unused-value -Wno-missing-field-initializers -Wno-narrowing -Wno-pointer-arith)

# nix workaround
if(CMAKE_EXPORT_COMPILE_COMMANDS)
  set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES
      ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
endif()

find_package(PkgConfig REQUIRED)
pkg_check_modules(DEPS REQUIRED hyprland pixman-1 libdrm pango pangocairo)

add_library(gaps SHARED
	src/main.cpp
	src/Hooks.cpp
)

target_include_directories(gaps PRIVATE ${DEPS_INCLUDE_DIRS})

install(TARGETS gaps LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
