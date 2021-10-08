#include "Container.h"

//------------------------------------------------------------------------------
// ----------------- CPP FILE OF THE 'CONTAINER' STRUCT ------------------------
//------------------------------------------------------------------------------

// Implementation of the method for creating a new container.
void CreateContainer(Container& container, int size) {
    container.size = size;
    container.all_animals = new Animal[size];
}

// Implementation of the method for deleting container.
void DeleteContainer(Container& container) {
    delete[] container.all_animals;
    container.size = 0;
}

// Implementation of the method for reading animal data from the given file.
void InputFromFile(Container& container, std::ifstream& input) {
    for (int i = 0; i < container.size; ++i) {
        Animal animal = Animal();
        InputFromFile(input, animal);
        *(container.all_animals + i) = animal;
    }
}

// Implementation of the method for filling in the container with random animals.
void InputRandom(Container& container) {
    // Alphabet for animals names generation.
    char letters[26] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                        'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
    for (int i = 0; i < container.size; ++i) {
        InputRandom(container.all_animals[i], letters);
    }
}

// Implementation of the method  for printing container information.
void Output(Container& container, std::ofstream& output) {
    output << " ---- CONTAINER WITH SIZE " << container.size << " ---- \n";
    for (int i = 0; i < container.size; i++) {
        output << i + 1 << ". ";
        // Calling method for printing all animals inside the container.
        Output(container.all_animals[i], output);
        output << " -------------------------- \n";
    }
}

//------------------------------------------------------------------------------
// ------------- BEGINNING OF BINARY INTERSECTION SORT CODE --------------------
//------------------------------------------------------------------------------

// A binary search based function to find the position where item should be inserted in array[low..high]
int BinarySearch(Animal array[], Animal item, int low, int high) {
    if (high <= low) {
        return (Quotient(item) < Quotient(array[low])) ? (low + 1) : low;
    }

    int mid = (low + high) / 2;

    if (Quotient(item) == Quotient(array[mid])) {
        return mid + 1;
    }

    if (Quotient(item) < Quotient(array[mid])) {
        return BinarySearch(array, item, mid + 1, high);
    }

    return BinarySearch(array, item, low, mid - 1);
}


// Function to sort an array all_animals[] of size 'n'
void SortContainerDataWithInsertionSort(Container& container) {
    int i, loc, j;
    int n = container.size;
    Animal* all_animals = container.all_animals;
    Animal selected = Animal();

    for (i = 1; i < n; ++i) {
        j = i - 1;
        selected = all_animals[i];

        // Find location where selected should be inserted.
        loc = BinarySearch(all_animals, selected, 0, j);

        // Move all elements after location to create space.
        while (j >= loc) {
            all_animals[j + 1] = all_animals[j];
            j--;
        }
        all_animals[j + 1] = selected;
    }
}