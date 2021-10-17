#include "Animal.h"

//------------------------------------------------------------------------------
// ----------------- CPP FILE OF PARENT CLASS 'ANIMAL' -------------------------
//------------------------------------------------------------------------------

// Implementation of the method for finding the coefficient.
double Animal::Quotient() const {
    // Sum of the codes of an unencrypted string 'name'.
    double sum = 0;
    for (char i: name_) {
        sum += int(i);
    }
    return sum / weight_;
}