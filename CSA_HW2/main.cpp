#include "Animal.h"
#include "Commander.h"
#include <ctime>
#include <cstring>
#include <fstream>
#include <iostream>
#include <memory>
#include <vector>
#include <utility>

//------------------------------------------------------------------------------
// ----------------- BEGINNING OF PROGRAM MESSAGES OUTPUT  ---------------------
//------------------------------------------------------------------------------

void IncorrectCommand() {
    std::cout << "Incorrect command!\n"
                 "  Waited:\n"
                 "     command -f <infile> <outfile01> <outfile02>\n"
                 "  Or:\n"
                 "     command -n <infile> <outfile01> <outfile02>\n";
}

void IncorrectContainerSize() {
    std::cout << "Incorrect container size! Must be integer between 1 and 10000 \n";
}

void Started() {
    std::cout << "  *** STARTED ***  \n";
}

void Finished() {
    std::cout << "  *** FINISHED ***  \n";
}

void Filled() {
    std::cout << "  *** FILLED ***  \n";;
}

void Sorted() {
    std::cout << "  *** SORTED ***  \n";;
}

void Printed() {
    std::cout << "  *** PRINTED ***  \n";;
}


//------------------------------------------------------------------------------
// --------------------- BEGINNING OF MAIN PROGRAM CODE ------------------------
//------------------------------------------------------------------------------

int main(int argc, char *argv[]) {
    if (argc != 5) {
        IncorrectCommand();
        return 1;
    }
    // This thing is for random.
    srand(time(nullptr));
    // Notifying user that program has started.
    Started();
    int size = 0;
    // Reading number of animals from file.
    std::ifstream input(argv[2]);
    input >> size;
    // Checking that number is correct.
    if (size < 1 || size > 10000) {
        IncorrectContainerSize();
        return -1;
    }
    // Creating a container-vector of animals.
    std::vector<std::unique_ptr<Animal>> zoo;
    // Initialising program memory for all animals.
    zoo.reserve(size);
    // Creating new commander for processing commands.
    Commander commander;
    // reading type of input.
    if (std::strcmp(argv[1], "-f") == 0) {
        commander.InputFromFile(zoo, input, size);
    } else if (std::strcmp(argv[1], "-n") == 0) {
        commander.InputRandom(zoo, size);
    } else {
        IncorrectCommand();
        return -1;
    }
    // Notifying user that container of animals was filled.
    Filled();
    // Reading directories for output files.
    std::ofstream general_output(argv[3]);
    std::ofstream sorted_output(argv[4]);
    // Printing data in the first file.
    commander.Print(zoo, general_output, size);
    // Notifying user that animals were printed to the file.
    Printed();
    // Sorting container-vector of animals.
    commander.SortContainerDataWithInsertionSort(zoo);
    // Notifying user that container of animals was sorted.
    Sorted();
    // Printing sorted data to the second file.
    commander.Print(zoo, sorted_output, size);
    // Notifying user that container sorted animals' data was printed.
    Printed();
    // Notifying user that program gas finished.
    Finished();
    // Displaying time spent on execution.
    std::cout << "  RUNTIME: " << clock() / 1000.0;
    return 0;
}
