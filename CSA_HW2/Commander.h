#ifndef CSA_HW2_CMAKE_BUILD_DEBUG_COMMANDER_H_
#define CSA_HW2_CMAKE_BUILD_DEBUG_COMMANDER_H_

#include <iostream>
#include <memory>
#include <string>
#include <utility>
#include <vector>
#include "Animal.h"
#include "Beast.h"
#include "Bird.h"
#include "Fish.h"

class Commander {
 public:
    void InputRandom(std::vector<std::unique_ptr<Animal>> &zoo, int size);

    void InputFromFile(std::vector<std::unique_ptr<Animal>> &zoo, std::ifstream &input, int size);

    void Print(std::vector<std::unique_ptr<Animal>> &zoo, std::ofstream &output, int size);

    void SortContainerDataWithInsertionSort(std::vector<std::unique_ptr<Animal>> &all_animals);
};



#endif //CSA_HW2_CMAKE_BUILD_DEBUG_COMMANDER_H_
