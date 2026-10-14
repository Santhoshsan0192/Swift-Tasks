func average(of marks: Int...) -> Double {
    if marks.isEmpty {
        return 0
    }
    return Double(marks.reduce(0, +)) / Double(marks.count)
}

func grade(for average: Double) -> String {
    switch average {
    case 90...:
        return "O"
    case 80..<90:
        return "A+"
    case 70..<80:
        return "A"
    case 60..<70:
        return "B"
    default:
        return "RA"
    }
}

func stats(of marks: [Int]) -> (min: Int, max: Int, average: Double)? {
    guard let lowest = marks.min(), let highest = marks.max() else {
        return nil
    }
    let mean = Double(marks.reduce(0, +)) / Double(marks.count)
    return (min: lowest, max: highest, average: mean)
}

func curve(_ marks: inout [Int], by bonus: Int = 5) {
    for index in marks.indices {
        marks[index] = min(marks[index] + bonus, 100)
    }
}

let mean = average(of: 82, 91, 67, 74)
print("Average: \(mean)")
print("Average of no marks: \(average())")
print("Grade: \(grade(for: mean))")

var marks = [82, 91, 67, 74, 98]

if let result = stats(of: marks) {
    print("Min: \(result.min), Max: \(result.max), Average: \(result.average)")
}

if stats(of: []) == nil {
    print("Stats of an empty array: nil")
}

curve(&marks)
print("After default curve: \(marks)")

curve(&marks, by: 10)
print("After curve of 10: \(marks)")
