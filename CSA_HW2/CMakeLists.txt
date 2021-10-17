cmake_minimum_required(VERSION 3.20)
project(CSA_HW2)

set(CMAKE_CXX_STANDARD 17)

add_executable(CSA_HW2
        Animal.cpp
        Animal.h
        Beast.cpp
        Beast.h
        Bird.h
        Bird.cpp
        Fish.h
        Fish.cpp
        Commander.cpp
        Commander.h
        main.cpp)
