cmake_minimum_required(VERSION 3.20)
project(CSA_HW1)

set(CMAKE_CXX_STANDARD 17)

add_executable(CSA_HW1
        Animal.h
        Animal.cpp
        Bird.h
        Bird.cpp
        Beast.h
        Beast.cpp
        Fish.h
        Fish.cpp
        Container.cpp
        Container.h
        main.cpp)
