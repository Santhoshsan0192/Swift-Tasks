enum BookStatus {
    case available
    case borrowed(by: String, dueIns: Int)
    case reserved(for: String)

    var label: String {
        switch self {
        case .available:
            return "Available"
        case .borrowed(let person, let days):
            return "Borrowed by \(person), due in \(days) days"
        case .reserved(let person):
            return "Reserved for \(person)"
        }
    }
}

struct Book {
    let title: String
    var status: BookStatus = .available
}

class Member {
    var name: String
    var borrowedBooks: [Book] = []

    init(name: String) {
        self.name = name
    }
}

let original = Book(title: "Swift Programming")
var copy = original
copy.status = .borrowed(by: "Asha", dueIns: 7)
print("Original: \(original.title) - \(original.status.label)")
print("Copy: \(copy.title) - \(copy.status.label)")

let member = Member(name: "Asha")
let sameMember = member
sameMember.name = "Ravi"
print("member.name: \(member.name)")
print("sameMember.name: \(sameMember.name)")
