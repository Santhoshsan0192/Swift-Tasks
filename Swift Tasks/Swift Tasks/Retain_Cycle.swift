class LeakyPerson {
    let name: String
    var apartment: LeakyApartment?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("LeakyPerson \(name) is deinitialized")
    }
}

class LeakyApartment {
    let unit: String
    var tenant: LeakyPerson?

    init(unit: String) {
        self.unit = unit
    }

    deinit {
        print("LeakyApartment \(unit) is deinitialized")
    }
}

class Person {
    let name: String
    var apartment: Apartment?

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Person \(name) is deinitialized")
    }
}

class Apartment {
    let unit: String
    weak var tenant: Person?

    init(unit: String) {
        self.unit = unit
    }

    deinit {
        print("Apartment \(unit) is deinitialized")
    }
}

func runStrongCycle() {
    var person: LeakyPerson? = LeakyPerson(name: "Asha")
    var apartment: LeakyApartment? = LeakyApartment(unit: "4B")
    person?.apartment = apartment
    apartment?.tenant = person
    person = nil
    apartment = nil
    print("Strong cycle: both variables are nil and no deinit message appeared")
}

func runWeakReference() {
    var person: Person? = Person(name: "Ravi")
    var apartment: Apartment? = Apartment(unit: "7C")
    person?.apartment = apartment
    apartment?.tenant = person
    person = nil
    apartment = nil
    print("Weak reference: both variables are nil and both deinit messages appeared")
}

runStrongCycle()
print("")
runWeakReference()
print("")
print("Why: a weak reference does not increase the retain count, so the apartment no longer keeps the person alive and both objects reach zero strong references and are freed.")
