#include "Fish.h"

//------------------------------------------------------------------------------
// -------------------- CPP FILE OF CHILD CLASS 'FISH' -------------------------
//------------------------------------------------------------------------------

// Implementation of the method for printing information about fish.
void Fish::Output(std::ofstream &output_file_stream) {
    output_file_stream << "Animal " << name_ << " with weight " << weight_ << " grams. \n";
    output_file_stream << "It's quotient from name to weight is " << Quotient() << ". \n";
    output_file_stream << "It's a fish, and it lives in the ";
    switch (habitat_) {
        case 1: output_file_stream << "river. \n";
            break;
        case 2: output_file_stream << "sea. \n";
            break;
        case 3: output_file_stream << "lake. \n";
            break;
        case 4: output_file_stream << "ocean. \n";
            break;
        default: output_file_stream << "pond. \n";
    }
}
