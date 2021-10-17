#include "Bird.h"

//------------------------------------------------------------------------------
// ------------------- CPP FILE OF CHILD CLASS 'BIRD' --------------------------
//------------------------------------------------------------------------------

// Implementation of the method for printing information about bird.
void Bird::Output(std::ofstream &output_file_stream) {
    output_file_stream << "Animal " << name_ << " with weight " << weight_ << " grams. \n";
    output_file_stream << "It's quotient from name to weight is " << Quotient() << ". \n";
    if (is_migratory_ == 0) {
        output_file_stream << "It's a bird and it's not migratory.\n";
    } else {
        output_file_stream << "It's a bird and it's migratory.\n";
    }
}