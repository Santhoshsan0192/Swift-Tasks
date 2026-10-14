protocol Entity {
    var id: Int { get }
}

enum RepositoryError: Error {
    case duplicateID(Int)
    case notFound(Int)
}

struct Repository<T: Entity> {
    private var storage: [Int: T] = [:]

    mutating func add(_ item: T) throws {
        guard storage[item.id] == nil else {
            throw RepositoryError.duplicateID(item.id)
        }
        storage[item.id] = item
    }

    func find(_ id: Int) -> T? {
        storage[id]
    }

    mutating func remove(_ id: Int) throws {
        guard storage.removeValue(forKey: id) != nil else {
            throw RepositoryError.notFound(id)
        }
    }

    func all(where predicate: (T) -> Bool) -> [T] {
        storage.values.filter(predicate).sorted { $0.id < $1.id }
    }
}

struct Student: Entity {
    let id: Int
    let name: String
    let marks: Int
}

struct Course: Entity {
    let id: Int
    let title: String
}

var students = Repository<Student>()

do {
    try students.add(Student(id: 3, name: "Meena", marks: 91))
    try students.add(Student(id: 1, name: "Asha", marks: 82))
    try students.add(Student(id: 2, name: "Ravi", marks: 35))
    try students.add(Student(id: 1, name: "Duplicate", marks: 0))
} catch {
    print("Add failed: \(error)")
}

print("All students: \(students.all(where: { _ in true }).map { $0.name })")
print("Passed students: \(students.all(where: { $0.marks >= 40 }).map { $0.name })")

if let found = students.find(2) {
    print("Found: \(found.name)")
}

if students.find(42) == nil {
    print("Student 42 not found")
}

do {
    try students.remove(2)
    print("Removed student 2")
    try students.remove(2)
} catch {
    print("Remove failed: \(error)")
}

var courses = Repository<Course>()

do {
    try courses.add(Course(id: 102, title: "UIKit"))
    try courses.add(Course(id: 101, title: "Swift"))
} catch {
    print("Add failed: \(error)")
}

print("All courses: \(courses.all(where: { _ in true }).map { $0.title })")
