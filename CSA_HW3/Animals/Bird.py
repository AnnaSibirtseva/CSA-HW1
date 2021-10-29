from Animals.Animal import Animal


# ------------------------------------------------------------------------------
# --------------------------- CHILD CLASS 'BIRD' -------------------------------
# ------------------------------------------------------------------------------

class Bird(Animal):

    # Constructor for child class bird with extra parameter - is bird migratory or not.
    def __init__(self, name, weight, is_migratory):
        super(Bird, self).__init__(name, weight)
        self.__is_migratory__ = is_migratory

    # Method for printing information about bird.
    def out(self):
        # Calling method for print basic info about bird.
        info = super(Bird, self).out()
        info += "It's a bird and it's "
        if self.__is_migratory__ == 0:
            info += "not "
        info += "migratory.\n"
        return info
