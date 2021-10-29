import sys
import time

from Commander import Commander


# ------------------------------------------------------------------------------
# ----------------------  PROGRAM MESSAGES OUTPUT  ----------------------------
# ------------------------------------------------------------------------------

def incorrect_command():
    print("Incorrect command!\n"
          "  Waited:\n"
          "     command -f <infile> <outfile01> <outfile02>\n"
          "  Or:\n"
          "     command -n <number> <outfile01> <outfile02>\n")


def incorrect_container_size():
    print("Incorrect container size! Must be integer between 1 and 10 000 \n")


def started():
    print("  *** STARTED *** ")


def finished():
    print("  *** FINISHED *** ")


def filled():
    print("  *** FILLED *** ")


def sorted():
    print("  *** SORTED *** ")


def printed():
    print("  *** PRINTED *** ")


# ------------------------------------------------------------------------------
# --------------------------- MAIN PROGRAM CODE ------------------------------
# ------------------------------------------------------------------------------

# Checking that number of line arguments is correct.
if len(sys.argv) != 5:
    incorrect_command()
    exit(-1)
# Starting timer to find out how long does it takes to process given parameters.
start_time = time.time()
# Notifying user that program has started.
started()
# Creating a container-vector of animals.
all_animals = []

# Reading number of animals from file.
input_stream = open(sys.argv[2], 'r', encoding="utf-8")
size = int(input_stream.readline())
# Checking that number is correct.
if size < 1 or size > 10_000:
    incorrect_container_size()
    exit(-1)

# Reading type of input.
command = sys.argv[1]
if command == "-f":
    Commander.input_from_file(size, all_animals, input_stream)
elif command == "-n":
    Commander.input_random(size, all_animals)
else:
    incorrect_command()
    exit(-1)
# Notifying user that container of animals was filled.
filled()
# Reading directories for output files.
general_output = open(sys.argv[3], 'w', encoding="utf-8")
sorted_output = open(sys.argv[4], 'w', encoding="utf-8")
# Printing data in the first file.
Commander.output_to_file(size, all_animals, general_output)
# Notifying user that animals were printed to the file.
printed()
# Sorting container-vector of animals.
Commander.sort_container_data_with_insertion_sort(size, all_animals)
# Notifying user that container of animals was sorted.
sorted()
# Printing sorted data to the second file.
Commander.output_to_file(size, all_animals, sorted_output)
# Notifying user that container sorted animals' data was printed.
printed()
# Notifying user that program gas finished.
finished()
# Displaying time spent on execution.
print(f"  RUNTIME: {round(time.time() - start_time, 3)}")
