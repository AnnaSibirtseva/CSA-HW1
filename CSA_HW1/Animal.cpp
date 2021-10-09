#include "Animal.h"
#include <cstring>

//------------------------------------------------------------------------------
// ---------------- CPP FILE OF PARENT STRUCT 'ANIMAL' -------------------------
//------------------------------------------------------------------------------

// Implementation of the method for finding the coefficient.
double Quotient(Animal &animal) {
    // Sum of the codes of an unencrypted string 'name'.
    double sum = 0;
    for (int i = 0; i < std::strlen(animal.name); ++i) {
        sum += int(animal.name[i]);
    }
    return sum / animal.weight;
}

// Implementation of the method for creating animal with chosen parameters.
void InputFromFile(std::ifstream &input_file_stream, Animal &animal) {
    int animal_type, animal_weight;
    char *animal_name = new char[64];
    input_file_stream >> animal_type >> animal_name >> animal_weight;

    if (animal_weight <= 0 || animal_weight >= INT32_MAX) {
        std::cout << "Incorrect animal weight, must be positive integer-type bigger than zero.\n";
        exit(-1);
    }
    animal.name = animal_name;
    animal.weight = animal_weight;

    // Creating a specific type of animal.
    switch (animal_type) {
        case 1: animal.key = Animal::BEAST;
            InputFromFile(animal.beast, input_file_stream);
            break;
        case 2: animal.key = Animal::BIRD;
            InputFromFile(animal.bird, input_file_stream);
            break;
        case 3: animal.key = Animal::FISH;
            InputFromFile(animal.fish, input_file_stream);
            break;
        default: std::cout << "Invalid animal type.\n";
            exit(-1);
    }
}

// Implementation of the method for creating animal with random parameters.
Animal *InputRandom(Animal &animal, const char letters[26]) {
    // Creating random name for animal.
    int name_length = rand() % 7 + 3;
    animal.name = new char[9]{' ',' ',' ',' ',' ',' ',' ',' ',' '};
    animal.name[0] = toupper(letters[rand() % 26]);
    for (int i = 1; i < 10; ++i) {
        if (i >= name_length) {
            animal.name[i] = '\0';
        } else {
            animal.name[i] = letters[rand() % 26];
        }
    }
    animal.weight = rand() % 100000 + 1;

    // Creating random number to find the type of animal.
    int animal_type = rand() % 3 + 1;
    // Creating a specific type of animal.
    switch (animal_type) {
        case 1: animal.key = Animal::BEAST;
            InputRandom(animal.beast);
            return &animal;
        case 2: animal.key = Animal::BIRD;
            InputRandom(animal.bird);
            return &animal;
        case 3: animal.key = Animal::FISH;
            InputRandom(animal.fish);
            return &animal;
        default: std::cout << "Invalid animal type.\n";
            exit(-1);
    }
}

// Implementation of the method for printing animal information.
void Output(Animal &animal, std::ofstream &output_file_stream) {
    // Common output for all kinds of animals.
    output_file_stream << "Animal " << animal.name << " with weight " << animal.weight << " grams. \n";
    output_file_stream << "It's quotient from name to weight is " << Quotient(animal) << ". \n";
    // Specific output for different animals.
    switch (animal.key) {
        case Animal::FISH: Output(animal.fish, output_file_stream);
            break;
        case Animal::BIRD: Output(animal.bird, output_file_stream);
            break;
        case Animal::BEAST: Output(animal.beast, output_file_stream);
            break;
        default: output_file_stream << "Incorrect animal.";
            exit(-1);
    }
}
