let isLeapYear: (Int) -> Bool = { year in
    (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
}

let isBetween1And100: (Int) -> Bool = { number in
    (1...100).contains(number)
}

let isEvenAndNotMultipleOf10: (Int) -> Bool = { number in
    number % 2 == 0 && number % 10 != 0
}

for year in [1900, 2000, 2024, 2026] {
    print("\(year) is a leap year: \(isLeapYear(year))")
}

for number in [0, 1, 50, 100, 101] {
    print("\(number) is between 1 and 100: \(isBetween1And100(number))")
}

for number in [4, 10, 20, 7, 22] {
    print("\(number) is even and not a multiple of 10: \(isEvenAndNotMultipleOf10(number))")
}

let nickname: String? = nil
print(nickname ?? "Guest")
