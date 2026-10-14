let swiftClub: Set<String> = ["Anu", "Ben", "Chitra", "Dev"]
let uiClub: Set<String> = ["Chitra", "Dev", "Esha"]

print("In both clubs: \(swiftClub.intersection(uiClub).sorted())")
print("Only in Swift club: \(swiftClub.subtracting(uiClub).sorted())")
print("Everyone: \(swiftClub.union(uiClub).sorted())")
print("In exactly one club: \(swiftClub.symmetricDifference(uiClub).sorted())")

let numbers = [3, 1, 3, 2, 1, 4]
var seen = Set<Int>()
var uniqueNumbers: [Int] = []
for number in numbers {
    if seen.insert(number).inserted {
        uniqueNumbers.append(number)
    }
}
print("Without duplicates: \(uniqueNumbers)")
