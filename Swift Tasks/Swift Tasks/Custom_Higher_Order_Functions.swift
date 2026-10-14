func myFilter(_ items: [Int], _ predicate: (Int) -> Bool) -> [Int] {
    var result: [Int] = []
    for item in items {
        if predicate(item) {
            result.append(item)
        }
    }
    return result
}

func applyTwice(_ value: Int, _ f: (Int) -> Int) -> Int {
    return f(f(value))
}

class Button {
    private var handlers: [() -> Void] = []

    func onTap(_ handler: @escaping () -> Void) {
        handlers.append(handler)
    }

    func tap() {
        for handler in handlers {
            handler()
        }
    }
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print("Even numbers: \(myFilter(numbers, { $0 % 2 == 0 }))")
print("Greater than 6: \(myFilter(numbers, { $0 > 6 }))")
print("applyTwice(3, add 5): \(applyTwice(3, { $0 + 5 }))")
print("applyTwice(3, square): \(applyTwice(3, { $0 * $0 }))")

let button = Button()
var tapCount = 0
button.onTap { print("First handler ran") }
button.onTap {
    tapCount += 1
    print("Second handler ran, tap count \(tapCount)")
}
button.tap()
button.tap()

print("")
print("Why @escaping: onTap stores the closure in the handlers array, so the closure is called after onTap has already returned. A closure that outlives the function call it was passed to must be marked @escaping.")
