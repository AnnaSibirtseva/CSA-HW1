from Animals.Animal import Animal


# ------------------------------------------------------------------------------
# --------------------------- CHILD CLASS 'FISH' -------------------------------
# ------------------------------------------------------------------------------

class Fish(Animal):
    habitat_types = ["river", "sea", "lake", "ocean", "pond"]

    # Constructor for child class fish with extra parameter - fish habitat.
    def __init__(self, name, weight, habitat):
        super(Fish, self).__init__(name, weight)
        self.__habitat__ = habitat

    # Method for printing information about fish.
    def out(self):
        # Calling method for print basic info about fish.
        info = super(Fish, self).out()
        info += "It's a fish, and it lives in the "
        if self.__habitat__ < 1 or self.__habitat__ > 5:
            print("Fish habitat type was incorrect so it was changed to default value (pond)")
            self.__habitat__ = 5
        info += self.habitat_types[self.__habitat__ - 1] + ".\n"
        return info
