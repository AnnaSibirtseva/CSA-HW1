#ifndef HSE_CSA_HW1__CONTAINER_H_
#define HSE_CSA_HW1__CONTAINER_H_

#include "Animal.h"

//------------------------------------------------------------------------------
// ----------------- HEADER FILE OF THE 'CONTAINER' STRUCT ---------------------
//------------------------------------------------------------------------------

// Creating 'container' struct.
struct Container {
    int size;
    Animal* all_animals;
};

// Method for container creation.
void CreateContainer(Container& container, int size);

// Method for deleting a container.
void DeleteContainer(Container& container);

// Method for filling in s container with file data.
void InputFromFile(Container& container, std::ifstream& input);

// Method for fillling in a container with random animals.
void InputRandom(Container& container);

// Method for printing container values.
void Output(Container& container, std::ofstream& output);

// Method for finding a correct place for animal.
int BinarySearch(Animal array[], Animal item, int low, int high);

// Method for sorting a container.
void SortContainerDataWithInsertionSort(Container& container);

#endif //HSE_CSA_HW1__CONTAINER_H_
