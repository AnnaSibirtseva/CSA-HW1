from random import randint

from Animals.Beast import Beast
from Animals.Bird import Bird
from Animals.Fish import Fish

# ------------------------------------------------------------------------------
# ----------------- CLASS 'COMMANDER' FOR MAIN PROGRAM LOGIC -------------------
# ------------------------------------------------------------------------------

# Alphabet for random name generation.
LETTERS = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
           'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']


# Method for reading animals data from the file.
def input_from_file(size, all_animals, input_stream):
    for i in range(size):
        animal_type = int(input_stream.read(1))
        parameters = input_stream.readline().split()
        # Checking that number of parameters is correct.
        if len(parameters) != 3:
            print("Number of parameters was incorrect! "
                  "Waited three numbers, read README.md for details.\n")
            exit(-1)
        if animal_type == 1:
            all_animals.append(Beast(parameters[0], int(parameters[1]), int(parameters[2])))
        elif animal_type == 2:
            all_animals.append(Bird(parameters[0], int(parameters[1]), int(parameters[2])))
        elif animal_type == 3:
            all_animals.append(Fish(parameters[0], int(parameters[1]), int(parameters[2])))
        else:
            print("Animal type is incorrect! Waited number between 1 and 3")


# Method for Creating random animals and fill the vector with them.
def input_random(size, all_animals):
    for i in range(size):
        animal_type = randint(1, 3)
        if animal_type == 1:
            all_animals.append(Beast(generate_name(), randint(1, 10_000), randint(1, 4)))
        elif animal_type == 2:
            all_animals.append(Bird(generate_name(), randint(1, 10_000), randint(1, 2)))
        else:
            all_animals.append(Fish(generate_name(), randint(1, 10_000), randint(1, 5)))


# Method for generating a random name.
def generate_name():
    # Defining the name length.
    name_length = randint(3, 9)
    # First letter should be capital letter.
    name = ("" + LETTERS[randint(0, 25)]).upper()
    for i in range(name_length):
        name += LETTERS[randint(0, 25)]
    return name


# Method for printing created data to the file.
def output_to_file(size, all_animals, output):
    output.write(f" ---- CONTAINER WITH SIZE {size} ---- \n")
    for index in range(len(all_animals)):
        # Number of animal should start with one.
        output.write(f"{index + 1}. ")
        output.write(all_animals[index].out())
        output.write(" -------------------------- \n")


# ------------------------------------------------------------------------------
# -------------- BEGINNING OF BINARY INTERSECTION SORT CODE --------------------
# ------------------------------------------------------------------------------

# A binary search based function to find the position where item should be inserted in array[low..high].
def binary_search(array, item, low, high):
    if high <= low:
        if item.quotient() < array[low].quotient():
            return low + 1
        return low

    mid = (low + high) // 2

    if item.quotient() == array[mid].quotient():
        return mid + 1

    if item.quotient() < array[mid].quotient():
        return binary_search(array, item, mid + 1, high)

    return binary_search(array, item, low, mid - 1)


# Function to sort an array all_animals[] of size 'n'.
def sort_container_data_with_insertion_sort(size, not_sorted_all_animals):
    all_animals = not_sorted_all_animals

    for i in range(1, size):
        j = i - 1
        selected = all_animals[i]

        # Find location where selected should be inserted.
        loc = binary_search(all_animals, selected, 0, j)

        # Move all elements after location to create space.
        while j >= loc:
            all_animals[j + 1] = all_animals[j]
            j -= 1
        all_animals[j + 1] = selected
