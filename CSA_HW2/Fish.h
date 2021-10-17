#ifndef CSA_HW2__FISH_H_
#define CSA_HW2__FISH_H_

#include <fstream>
#include <iostream>
#include "Animal.h"

//------------------------------------------------------------------------------
// ------------------ HEADER FILE OF CHILD CLASS 'FISH' ------------------------
//------------------------------------------------------------------------------

class Fish : public Animal {
 public:
    Fish() = default;

    Fish(const std::string &name, int weight, int additional) : Animal(name, weight), habitat_(additional) {
    }

    // Method for printing information about fish.
    void Output(std::ofstream &general_output) override;

 private:
    enum Habitat {
        RIVER,
        SEA,
        LAKE,
        OCEAN,
        POND,
    };
    int habitat_{};
};

#endif //CSA_HW2__FISH_H_
