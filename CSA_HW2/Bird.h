#ifndef HSE_CSA_HW2__BIRD_H_
#define HSE_CSA_HW2__BIRD_H_

#include <fstream>
#include <iostream>
#include "Animal.h"

//------------------------------------------------------------------------------
// ----------------- HEADER FILE OF CHILD CLASS 'BIRD' ------------------------
//------------------------------------------------------------------------------

class Bird : public Animal {
 public:
    Bird() = default;

    Bird(const std::string &name, int weight, int additional) : Animal(name, weight), is_migratory_(additional) {
    }

    // Method for printing information about bird.
    void Output(std::ofstream &general_output) override;

 private:
    int is_migratory_{};
};

#endif //HSE_CSA_HW2__BIRD_H_
