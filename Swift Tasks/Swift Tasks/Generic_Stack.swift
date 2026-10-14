struct Stack<Element> {
    private var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element? {
        items.popLast()
    }

    var top: Element? {
        items.last
    }

    var isEmpty: Bool {
        items.isEmpty
    }

    var count: Int {
        items.count
    }
}

func largest<T: Comparable>(in items: [T]) -> T? {
    items.max()
}

func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var intStack = Stack<Int>()
intStack.push(10)
intStack.push(20)
intStack.push(30)
print("Int stack top: \(intStack.top ?? -1), count: \(intStack.count)")
print("Popped: \(intStack.pop() ?? -1)")
print("Int stack count after pop: \(intStack.count), isEmpty: \(intStack.isEmpty)")

var stringStack = Stack<String>()
stringStack.push("Swift")
stringStack.push("UIKit")
print("String stack top: \(stringStack.top ?? "none"), count: \(stringStack.count)")
print("Popped: \(stringStack.pop() ?? "none")")
print("Popped: \(stringStack.pop() ?? "none")")
print("Popped from empty stack: \(stringStack.pop() ?? "nothing to pop")")

print("Largest integer: \(largest(in: [3, 9, 2, 7]) ?? 0)")
print("Largest string: \(largest(in: ["apple", "mango", "banana"]) ?? "none")")
print("Largest of empty array: \(largest(in: [Int]()) ?? 0)")

var first = 1
var second = 2
swapValues(&first, &second)
print("After swap: first = \(first), second = \(second)")

var firstWord = "left"
var secondWord = "right"
swapValues(&firstWord, &secondWord)
print("After swap: firstWord = \(firstWord), secondWord = \(secondWord)")

print("Calling largest with a type that is not Comparable fails at compile time with: global function 'largest(in:)' requires that 'T' conform to 'Comparable'.")
