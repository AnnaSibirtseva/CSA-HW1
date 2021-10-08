#ifndef HSE_CSA_HW1__BEAST_H_
#define HSE_CSA_HW1__BEAST_H_

#include <fstream>
#include <iostream>

//------------------------------------------------------------------------------
// -------------- HEADER FILE OF CHILD STRUCT 'BEAST' ------------------------
//------------------------------------------------------------------------------

// Creating 'beast' struct.
struct Beast {
    enum Nutrition {
        CARNIVORES,
        HERBIVORES,
        INSECTIVORES,
        OMNIVORES
    };
    Nutrition nutrition;
};

// Method to filling parameters from file for beats.
void InputFromFile(Beast &beast, std::ifstream &ifst);

// Method to filling parameters with random numbers for beats.
void InputRandom(Beast &beast);

// Method for printing information about beast.
void Output(Beast &beast, std::ofstream &ofst);
#endif //HSE_CSA_HW1__BEAST_H_
