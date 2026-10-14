protocol Entity {
    var id: Int { get }
}

protocol Describable {
    var summary: String { get }
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

extension Repository where T: Describable {
    func printReport() {
        print("Report")
        for item in all(where: { _ in true }) {
            print("- \(item.summary)")
        }
    }
}

struct Student: Entity, Describable {
    let id: Int
    let name: String
    let marks: Int

    var summary: String {
        "Student #\(id): \(name) scored \(marks)"
    }
}

struct Course: Entity, Describable {
    let id: Int
    let title: String

    var summary: String {
        "Course #\(id): \(title)"
    }
}

struct Room: Entity {
    let id: Int
}

var students = Repository<Student>()
var courses = Repository<Course>()
var rooms = Repository<Room>()

do {
    try students.add(Student(id: 2, name: "Ravi", marks: 35))
    try students.add(Student(id: 1, name: "Asha", marks: 82))
    try courses.add(Course(id: 102, title: "UIKit"))
    try courses.add(Course(id: 101, title: "Swift"))
    try rooms.add(Room(id: 7))
} catch {
    print("Setup failed: \(error)")
}

students.printReport()
print("")
courses.printReport()
print("")
print("Rooms stored: \(rooms.all(where: { _ in true }).count)")
print("rooms.printReport() does not compile because Room does not conform to Describable, so the extension does not exist for Repository<Room>.")
