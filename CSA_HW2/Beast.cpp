#include "Beast.h"

//------------------------------------------------------------------------------
// ------------------- CPP FILE OF CHILD CLASS 'FISH' --------------------------
//------------------------------------------------------------------------------

// Implementation of the method for printing information about beast.
void Beast::Output(std::ofstream &output_file_stream) {
    output_file_stream << "Animal " << name_ << " with weight " << weight_ << " grams. \n";
    output_file_stream << "It's quotient from name to weight is " << Quotient() << ". \n";
    output_file_stream << "It's a beast and it's ";
    switch (nutrition_) {
        case 1: output_file_stream << "carnivores.\n";
            break;
        case 2: output_file_stream << "herbivores.\n";
            break;
        case 3: output_file_stream << "insectivores.\n";
            break;
        default: output_file_stream << "omnivores.\n";
    }
}
