from Animals.Animal import Animal


# ------------------------------------------------------------------------------
# --------------------------- CHILD CLASS 'BEAST' ------------------------------
# ------------------------------------------------------------------------------


class Beast(Animal):
    nutrition_types = ["carnivore", "herbivore", "insectivore", "omnivore"]

    # Constructor for child class beast with extra parameter - nutrition type.
    def __init__(self, name, weight, nutrition):
        super(Beast, self).__init__(name, weight)
        self.__nutrition__ = nutrition

    # Method for printing information about beast.
    def out(self):
        # Calling method for print basic info about beast.
        info = super(Beast, self).out()
        info += "It's a beast and it's a"
        if self.__nutrition__ < 1 or self.__nutrition__ > 4:
            print("Beast nutrition type was incorrect so it was changed to default value (omnivores)")
            self.__nutrition__ = 4
        if 3 <= self.__nutrition__ <= 4:
            info += "n"
        info += " " + self.nutrition_types[self.__nutrition__ - 1] + ".\n"
        return info
