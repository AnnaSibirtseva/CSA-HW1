#ifndef HSE_CSA_HW2__BEAST_H_
#define HSE_CSA_HW2__BEAST_H_

#include "Animal.h"

//------------------------------------------------------------------------------
// ----------------- HEADER FILE OF CHILD CLASS 'BEAST' ------------------------
//------------------------------------------------------------------------------

class Beast : public Animal {
 public:
    Beast() = default;

    Beast(const std::string &name, int weight, int additional) : Animal(name, weight), nutrition_(additional) {
    }

    // Method for printing information about beast.
    void Output(std::ofstream &general_output) override;

 private:
    enum Nutrition {
        CARNIVORES,
        HERBIVORES,
        INSECTIVORES,
        OMNIVORES
    };
    int nutrition_{};
};


#endif //HSE_CSA_HW2__BEAST_H_
