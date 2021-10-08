#include "Bird.h"

//------------------------------------------------------------------------------
// ---------------- CPP FILE OF CHILD STRUCT 'BIRD' -------------------------
//------------------------------------------------------------------------------

// Implementation of the method to filling parameters from file for bird.
void InputFromFile(Bird &bird, std::ifstream &ifst) {
    int migratory_input = 1;
    // Reading users input.
    ifst >> migratory_input;
    // Defining if bird is migratory or not.
    switch (migratory_input) {
        case 0: bird.is_migratory = 0;
            break;
        default: bird.is_migratory = migratory_input;
    }
}

// Implementation of the method to filling parameters with random numbers for bird.
void InputRandom(Bird &bird) {
    // Creating random number for defining if bird is migratory or not.
    int migratory_input = rand() % 2;
    switch (migratory_input) {
        case 0: bird.is_migratory = 0;
            break;
        default: bird.is_migratory = migratory_input;
    }
}

// Implementation of the method for printing information about bird.
void Output(Bird &bird, std::ofstream &ofst) {
    if (bird.is_migratory == 0) {
        ofst << "It's a bird and it's not migratory.\n";
    } else {
        ofst << "It's a bird and it's migratory.\n";
    }
}