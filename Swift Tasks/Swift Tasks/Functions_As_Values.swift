func makeMultiplier(_ factor: Int) -> (Int) -> Int {
    return { number in number * factor }
}

func apply(_ values: [Int], using transform: (Int) -> Int) -> [Int] {
    var result: [Int] = []
    for value in values {
        result.append(transform(value))
    }
    return result
}

let double = makeMultiplier(2)
let triple = makeMultiplier(3)
let numbers = [1, 2, 3, 4, 5]

print("double(7) = \(double(7))")
print("triple(7) = \(triple(7))")
print("Doubled: \(apply(numbers, using: double))")
print("Tripled: \(apply(numbers, using: triple))")
print("Squared: \(apply(numbers, using: { $0 * $0 }))")

print("")
print("First-class values: functions have a type like (Int) -> Int, so they can be stored in constants (double, triple), returned from functions (makeMultiplier) and passed as arguments (apply), exactly like an Int or a String.")
