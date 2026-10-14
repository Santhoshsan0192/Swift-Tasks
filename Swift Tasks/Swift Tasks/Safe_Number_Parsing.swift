let entries = ["10", "x", "25", "", "7.5", "40"]

let validNumbers = entries.compactMap { Int($0) }
let sum = validNumbers.reduce(0, +)
let invalidCount = entries.count - validNumbers.count
let firstDoubled = validNumbers.first.map { $0 * 2 }

print("Valid integers: \(validNumbers)")
print("Sum: \(sum)")
print("Invalid entries: \(invalidCount)")

if let doubled = firstDoubled {
    print("First valid number doubled: \(doubled)")
} else {
    print("There is no valid number")
}
