print("Crash 1: scores[\"Kiran\"]! force-unwraps nil because the dictionary has no key \"Kiran\".")
print("Crash 2: Int(\"12a\")! force-unwraps nil because \"12a\" is not a valid integer.")
print("")

let scores = ["Asha": 90, "Ravi": 72]

let kiran = scores["Kiran"]
let number = Int("12a")

if kiran == nil {
    print("No score found for Kiran")
}

if number == nil {
    print("\"12a\" is not a valid number")
}

if let kiranScore = kiran, let parsedNumber = number {
    print(kiranScore + parsedNumber)
} else {
    print("Cannot calculate the total because a value is missing")
}
