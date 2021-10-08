#ifndef HSE_CSA_HW1__ANIMAL_H_
#define HSE_CSA_HW1__ANIMAL_H_

#include <fstream>
#include <iostream>
#include "Beast.h"
#include "Fish.h"
#include "Bird.h"

//------------------------------------------------------------------------------
// -------------- HEADER FILE OF PARENT STRUCT 'ANIMAL' ------------------------
//------------------------------------------------------------------------------

// Creating an 'animal' struct.
struct Animal {
    char *name;
    int weight;
    // Mentioning all types of animals that could be.
    enum AnimalType {
        BEAST,
        BIRD,
        FISH
    };
    AnimalType key;
    union {
        Beast beast;
        Bird bird;
        Fish fish;
    };
};

// Method for creating an animal by user selected parameters.
void InputFromFile(std::ifstream &input_file_stream, Animal &animal);

// Method for creating a random animal.
Animal *InputRandom(Animal &animal, const char letters[26]);

// Method to print user-friendly information about animal.
void Output(Animal &animal, std::ofstream &output_file_stream);

// Method to find quotient of dividing the sum of the codes of an unencrypted string by the weight.
double Quotient(Animal &animal);

#endif //HSE_CSA_HW1__ANIMAL_H_
