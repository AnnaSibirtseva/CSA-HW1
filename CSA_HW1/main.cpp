#include <iostream>
#include <string>
#include <ctime>
#include <string>
#include "Container.h"

//------------------------------------------------------------------------------
// ----------------- BEGINNING OF PROGRAM MESSAGES OUTPUT  ---------------------
//------------------------------------------------------------------------------

void IncorrectCommand() {
    std::cout << "Incorrect command!\n"
                 "  Waited:\n"
                 "     command -f <infile> <outfile01> <outfile02>\n"
                 "  Or:\n"
                 "     command -n <number> <outfile01> <outfile02>\n";
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
    srand(time(NULL));

    Started();
    Container container;
    int size = 0;
    std::ifstream input(argv[2]);
    input >> size;
    if (size < 1 || size > 10000) {
        IncorrectContainerSize();
        return -1;
    }
    CreateContainer(container, size);

    if (std::strcmp(argv[1], "-f") == 0) {
        InputFromFile(container, input);
    } else if (std::strcmp(argv[1], "-n") == 0) {
        InputRandom(container);
    } else {
        IncorrectCommand();
        return -1;
    }
    Filled();

    std::ofstream general_output(argv[3]);
    std::ofstream sorted_output(argv[4]);
    Output(container, general_output);
    Printed();

    SortContainerDataWithInsertionSort(container);
    Sorted();
    Output(container, sorted_output);
    Printed();

    DeleteContainer(container);
    Finished();
    std::cout << "  RUNTIME: " << clock() / 1000.0;
    return 0;
}
