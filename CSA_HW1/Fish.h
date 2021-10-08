#ifndef CSA_HW1__FISH_H_
#define CSA_HW1__FISH_H_

#include <fstream>
#include <iostream>

//------------------------------------------------------------------------------
// -------------- HEADER FILE OF CHILD STRUCT 'FISH' ------------------------
//------------------------------------------------------------------------------

// Creating 'fish' struct.
struct Fish {
    enum Habitat {
        RIVER,
        SEA,
        LAKE,
        OCEAN,
        POND,
    };
    Habitat habitat;
};

// Method to filling parameters from file for fish.
void InputFromFile(Fish &fish, std::ifstream &ifst);

// Method to filling parameters with random numbers for fish.
void InputRandom(Fish &fish);

// Method for printing information about fish.
void Output(Fish &fish, std::ofstream &ofst);

#endif //CSA_HW1__FISH_H_
