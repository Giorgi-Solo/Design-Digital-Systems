cmake_minimum_required(VERSION 3.16.3)
project(untitled C)

set(CMAKE_C_STANDARD 11)

add_executable(RSA main.c RSA.c test/test.c)

