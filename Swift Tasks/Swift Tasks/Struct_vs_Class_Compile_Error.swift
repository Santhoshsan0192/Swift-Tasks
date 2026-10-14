struct Counter {
    var value = 0
    mutating func increment() { value += 1 }
}

class Box {
    var value = 0
    func increment() { value += 1 }
}

print("The compile error was on the line 'c.increment()' while c was declared with let.")
print("Reason: Counter is a struct, a value type. A mutating method changes the value itself, and a let constant forbids changing it.")
print("Fix: declare the struct instance with var.")
print("Why the class version works: a let constant of a class type holds a fixed reference. The reference never changes, only the object it points to, so calling increment() is allowed.")

var c = Counter()
c.increment()
print("Counter value: \(c.value)")

let b = Box()
b.increment()
print("Box value: \(b.value)")

let first = Box()
let second = first
second.increment()
print("first === second: \(first === second)")
print("first.value: \(first.value), second.value: \(second.value)")
