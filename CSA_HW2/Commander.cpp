#include "Commander.h"

//------------------------------------------------------------------------------
// --------------------- CPP FILE OF CLASS COMMANDER ---------------------------
//------------------------------------------------------------------------------

// Constant variable for english alphabet.
const char kLetters[26] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                           'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};

// Method for generating a random name.
std::string RandomName(const char letters[26]) {
    // Defining the name length.
    int name_length = rand() % 7 + 3;
    std::string name;
    // First letter should be capital letter.
    name += toupper(letters[rand() % 26]);
    for (int i = 1; i < name_length; ++i) {
        name += letters[rand() % 26];
    }
    return name;
}

// Method for Creating random animals and fill the vector with them.
void Commander::InputRandom(std::vector<std::unique_ptr<Animal>> &zoo, int size) {
    for (int i = 0; i < size; ++i) {
        // Creating a random number for animal type.
        int animal_type = rand() % 3 + 1;
        switch (animal_type) {
            case 1:
                zoo.push_back(std::make_unique<Beast>(RandomName(kLetters),
                                                      rand() % 100000, rand() % 3 + 1));
                break;
            case 2:
                zoo.push_back(std::make_unique<Bird>(RandomName(kLetters),
                                                     rand() % 100000, rand() % 2 + 1));
                break;
            case 3:
                zoo.push_back(std::make_unique<Fish>(RandomName(kLetters),
                                                     rand() % 100000, rand() % 5 + 1));
                break;
        }
    }
}

// Method for reading animals data from the file.
void Commander::InputFromFile(std::vector<std::unique_ptr<Animal>> &zoo,
                              std::ifstream &input, int size) {
    for (int i = 0; i < size; ++i) {
        int animal_type, weight, additional;
        std::string name;
        input >> animal_type >> name >> weight >> additional;
        switch (animal_type) {
            case 1: zoo.push_back(std::make_unique<Beast>(name, weight, additional));
                break;
            case 2: zoo.push_back(std::make_unique<Bird>(name, weight, additional));
                break;
            case 3: zoo.push_back(std::make_unique<Fish>(name, weight, additional));
                break;
            default: std::cout << "Invalid animal type.\n";
                exit(-1);
        }
    }
}

// Method for printing created data to the file.
void Commander::Print(std::vector<std::unique_ptr<Animal>> &zoo, std::ofstream &output, int size) {
    output << " ---- CONTAINER WITH SIZE " << size << " ---- \n";
    for (int i = 0; i < size; ++i) {
        output << i + 1 << ". ";
        zoo[i]->Output(output);
        output << " -------------------------- \n";
    }
}

//------------------------------------------------------------------------------
// ------------- BEGINNING OF BINARY INTERSECTION SORT CODE --------------------
//------------------------------------------------------------------------------

// A binary search based function to find the position where item should be inserted in array[low..high].
int BinarySearch(const std::vector<std::unique_ptr<Animal>> &array, std::unique_ptr<Animal> &item, int low, int high) {
    if (high <= low) {
        return (item->Quotient() < array[low]->Quotient()) ? (low + 1) : low;
    }

    int mid = (low + high) / 2;

    if (item->Quotient() == array[mid]->Quotient()) {
        return mid + 1;
    }

    if (item->Quotient() < array[mid]->Quotient()) {
        return BinarySearch(array, item, mid + 1, high);
    }

    return BinarySearch(array, item, low, mid - 1);
}


// Function to sort an array all_animals[] of size 'n'.
void Commander::SortContainerDataWithInsertionSort(std::vector<std::unique_ptr<Animal>> &all_animals) {
    int i, loc, j;
    int n = all_animals.size();
    std::unique_ptr<Animal> selected;

    for (i = 1; i < n; ++i) {
        j = i - 1;
        selected = std::move(all_animals[i]);

        // Find location where selected should be inserted.
        loc = BinarySearch(all_animals, selected, 0, j);

        // Move all elements after location to create space.
        while (j >= loc) {
            std::swap(all_animals[j +1], all_animals[j]);
            j--;
        }
        all_animals[j +1] = std::move(selected);
    }
}


