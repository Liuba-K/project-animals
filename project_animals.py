class Animals:
    def __init__(self):
        self.pets = ModelsElements().create_element("pets", 1, 2)
        self.pack_animals = ModelsElements().create_element("pack_animals", 1, 2)

class Pets(Animals):
    def __init__(self):
        self.dogs = ModelsElements().create_element("dogs", 1, 2)
        self.cats = ModelsElements().create_element("cats", 1, 2)
        self.hamsters = ModelsElements().create_element("hamsters", 1, 2)

class PackAnimals(Animals):
    def __init__(self):
        self.horses = ModelsElements().create_element("horses", 1, 2)
        self.camels = ModelsElements().create_element("camels", 1, 2)
        self.donkeys = ModelsElements().create_element("donkeys", 1, 2)


class Dogs(Pets):
    def __init__(self):
        self.name = ModelsElements().create_element("name", 1, 2)

    def command(self):
        pass


class Cats(Pets):
    def __init__(self):
        self.name = ModelsElements().create_element("name", 1, 2)

    def command(self):
        pass


class Hamsters(Pets):
    def __init__(self):
        self.name = ModelsElements().create_element("name", 1, 2)

    def command(self):
        pass


class Horses(PackAnimals):
    def __init__(self):
        self.name = ModelsElements().create_element("name", 1, 2)

    def command(self):
        pass

class Camels(PackAnimals):
    def __init__(self):
        self.name = ModelsElements().create_element("name", 1, 2)

    def command(self):
        pass

class Donkeys(PackAnimals):
    def __init__(self):
        self.name = ModelsElements().create_element("name", 1, 2)

    def command(self):
        pass
