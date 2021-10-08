#ifndef HSE_CSA_HW1__BIRD_H_
#define HSE_CSA_HW1__BIRD_H_

#include <fstream>
#include <iostream>

//------------------------------------------------------------------------------
// -------------- HEADER FILE OF CHILD STRUCT 'BIRD' ------------------------
//------------------------------------------------------------------------------

// Creating 'bird' struct.
struct Bird {
    int is_migratory;
};

// Method to filling parameters from file for bird.
void InputFromFile(Bird &bird, std::ifstream &ifst);

// Method to filling parameters with random numbers for bird.
void InputRandom(Bird &bird);

// Method for printing information about bird.
void Output(Bird &bird, std::ofstream &ofst);

#endif //HSE_CSA_HW1__BIRD_H_
