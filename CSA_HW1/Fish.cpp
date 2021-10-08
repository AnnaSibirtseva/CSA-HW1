#include "Fish.h"

//------------------------------------------------------------------------------
// ---------------- CPP FILE OF CHILD STRUCT 'FISH' -------------------------
//------------------------------------------------------------------------------

// Implementation of the method to filling parameters from file for fish.
void InputFromFile(Fish &fish, std::ifstream &ifst) {
    int living_place = 1;
    // Reading users input.
    ifst >> living_place;
    // Defining fish habitat.
    switch (living_place) {
        case 1: fish.habitat = Fish::RIVER;
            break;
        case 2: fish.habitat = Fish::SEA;
            break;
        case 3: fish.habitat = Fish::LAKE;
            break;
        case 4: fish.habitat = Fish::OCEAN;
            break;
        case 5: fish.habitat = Fish::POND;
            break;
        default: fish.habitat = Fish::POND;
            std::cout << "Your input for fish habitat was incorrect, "
                         "so program assigned the default one (which is pond)\n";
    }
}

// Implementation of the method to filling parameters with random numbers for fish.
void InputRandom(Fish &fish) {
    // Creating random number for
    // Creating random number ford defining fish habitat.
    int living_place = rand() % 5 + 1;
    switch (living_place) {
        case 1: fish.habitat = Fish::RIVER;
            break;
        case 2: fish.habitat = Fish::SEA;
            break;
        case 3: fish.habitat = Fish::LAKE;
            break;
        case 4: fish.habitat = Fish::OCEAN;
            break;
        default: fish.habitat = Fish::POND;
    }
}

// Implementation of the method for printing information about fish.
void Output(Fish &fish, std::ofstream &ofst) {
    ofst << "It's a fish, and it lives in the ";
    switch (fish.habitat) {
        case 1: ofst << "river. \n";
            break;
        case 2: ofst << "sea. \n";
            break;
        case 3: ofst << "lake. \n";
            break;
        case 4: ofst << "ocean. \n";
            break;
        default: ofst << "pond. \n";
    }
}
