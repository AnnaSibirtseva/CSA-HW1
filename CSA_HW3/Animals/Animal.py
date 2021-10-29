# ------------------------------------------------------------------------------
# -------------------------- PARENT CLASS 'ANIMAL' -----------------------------
# ------------------------------------------------------------------------------

class Animal:

    # Constructor for animals.
    def __init__(self, name, weight):
        # Checking that weight is correct.
        if weight < 0 or weight >= 10_000_000:
            print("Incorrect animal weight, must be positive integer-type"
                  " bigger than zero and smaller than 10 000 000.\n")
            exit(-1)
        # Assigning values.
        self.__nickname__ = name
        self.__weight__ = weight

    # Method to find quotient of dividing the sum of the codes of an unencrypted string by the weight.
    def quotient(self):
        # Sum of the codes of an unencrypted string 'name'.
        chars_sum = 0.0
        for letter in self.__nickname__:
            chars_sum += ord(letter)
        return chars_sum / self.__weight__

    # Printing common information for all animals.
    def out(self):
        return (f'Animal {self.__nickname__} '
                f'with weight {self.__weight__} grams.\n'
                f"It's quotient from name to weight is {round(self.quotient(), 5)}. \n")
