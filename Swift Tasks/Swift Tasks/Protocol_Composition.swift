protocol Flyable {
    func fly()
}

protocol Swimmable {
    func swim()
}

struct Duck: Flyable, Swimmable {
    func fly() {
        print("Duck flies")
    }

    func swim() {
        print("Duck swims")
    }
}

struct Eagle: Flyable {
    func fly() {
        print("Eagle flies")
    }
}

struct Fish: Swimmable {
    func swim() {
        print("Fish swims")
    }
}

func showOff(_ animal: Flyable & Swimmable) {
    animal.fly()
    animal.swim()
}

showOff(Duck())

print("")
print("showOff(Eagle()) and showOff(Fish()) do not compile because Eagle is not Swimmable and Fish is not Flyable.")
print("Why this is more flexible than inheritance: with Bird and FishAnimal base classes a Duck would have to pick one parent, but with protocols a type can adopt any combination of abilities, structs can conform too, and new abilities can be added without changing a class tree.")
