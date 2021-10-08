#include "Beast.h"

//------------------------------------------------------------------------------
// ---------------- CPP FILE OF CHILD STRUCT 'BEAST' -------------------------
//------------------------------------------------------------------------------

// Implementation of the method to filling parameters from file for beats.
void InputFromFile(Beast &beast, std::ifstream &ifst) {
    int nutrition_number = 1;
    ifst >> nutrition_number;
    // Choosing nutrition depending on users input.
    switch (nutrition_number) {
        case 1: beast.nutrition = Beast::CARNIVORES;
            break;
        case 2: beast.nutrition = Beast::HERBIVORES;
            break;
        case 3: beast.nutrition = Beast::INSECTIVORES;
            break;
        case 4: beast.nutrition = Beast::OMNIVORES;
            break;
        default: beast.nutrition = Beast::OMNIVORES;
            std::cout << "Your input for beast nutrition was incorrect, "
                         "so program assigned the default one (which is omnivores)\n";
    }
}

// Implementation of the method to filling parameters with random numbers for beats.
void InputRandom(Beast &beast) {
    // Generating a random number for nutrition type.
    int nutrition_number = rand() % 4 + 1;
    // Choosing nutrition depending on random number.
    switch (nutrition_number) {
        case 1: beast.nutrition = Beast::CARNIVORES;
            break;
        case 2: beast.nutrition = Beast::HERBIVORES;
            break;
        case 3: beast.nutrition = Beast::INSECTIVORES;
            break;
        default: beast.nutrition = Beast::OMNIVORES;
    }
}

// Implementation of the method for printing information about beast.
void Output(Beast &beast, std::ofstream &ofst) {
    ofst << "It's a beast and it's ";
    switch (beast.nutrition) {
        case 1: ofst << "carnivores.\n";
            break;
        case 2: ofst << "herbivores.\n";
            break;
        case 3: ofst << "insectivores.\n";
            break;
        default: ofst << "omnivores.\n";
    }
}