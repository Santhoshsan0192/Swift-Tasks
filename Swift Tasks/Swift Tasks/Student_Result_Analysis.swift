import Foundation

struct Student {
    let name: String
    let marks: Int
    let dept: String

    var hasPassed: Bool {
        marks >= 40
    }
}

let students = [
    Student(name: "Asha", marks: 82, dept: "IT"),
    Student(name: "Ravi", marks: 35, dept: "CSE"),
    Student(name: "Meena", marks: 91, dept: "IT"),
    Student(name: "Kiran", marks: 56, dept: "ECE"),
    Student(name: "Divya", marks: 67, dept: "CSE"),
    Student(name: "Arjun", marks: 40, dept: "IT")
]

let passed = students.filter { $0.marks >= 40 }
print("Passed: \(passed.map { $0.name })")

let names = students.map { $0.name }
print("Names: \(names)")

let totalMarks = students.map { $0.marks }.reduce(0, +)
let classAverage = Double(totalMarks) / Double(students.count)
print("Class average: \(String(format: "%.2f", classAverage))")

let ranked = students.sorted { $0.marks > $1.marks }
for (position, student) in ranked.enumerated() {
    print("\(position + 1). \(student.name) - \(student.marks)")
}

let grouped = Dictionary(grouping: students, by: { $0.dept })
for dept in grouped.keys.sorted() {
    let members = grouped[dept, default: []].map { $0.name }
    print("\(dept): \(members)")
}

let fullForm = students.filter({ (student: Student) -> Bool in
    return student.marks >= 40
})
let shorthand = students.filter { $0.marks >= 40 }
let keyPath = students.filter(\.hasPassed)

print("Full form: \(fullForm.map { $0.name })")
print("Shorthand: \(shorthand.map { $0.name })")
print("Key path: \(keyPath.map { $0.name })")
