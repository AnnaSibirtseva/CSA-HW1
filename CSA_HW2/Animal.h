#ifndef HSE_CSA_HW2__ANIMAL_H_
#define HSE_CSA_HW2__ANIMAL_H_

#include <fstream>
#include <iostream>

//------------------------------------------------------------------------------
// --------------- HEADER FILE OF PARENT CLASS 'ANIMAL' ------------------------
//------------------------------------------------------------------------------

class Animal {
 public:
    // Default constructor.
    Animal() = default;

    Animal(std::string name, int weight) : name_(std::move(name)), weight_(weight) {
        if (weight < 0 || weight >= INT32_MAX) {
            std::cout << "Incorrect animal weight, must be positive integer-type bigger than zero.\n";
            exit(-1);
        }
    }

    // Method to print user-friendly information about animal.
    virtual void Output(std::ofstream &general_output) = 0;

    // Method to find quotient of dividing the sum of the codes of an unencrypted string by the weight.
    double Quotient() const;

 protected:
    std::string name_{};
    int weight_{};
};

#endif //HSE_CSA_HW2__ANIMAL_H_
