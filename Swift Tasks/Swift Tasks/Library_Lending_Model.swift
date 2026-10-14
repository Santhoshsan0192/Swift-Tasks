protocol Borrowable {
    var id: Int { get }
    var title: String { get }
    var isAvailable: Bool { get set }
}

struct Book: Borrowable {
    let id: Int
    let title: String
    let author: String
    var isAvailable = true
}

struct Magazine: Borrowable {
    let id: Int
    let title: String
    let issue: Int
    var isAvailable = true
}

enum LibraryError: Error {
    case itemNotFound(id: Int)
    case alreadyBorrowed(title: String)
    case limitReached(max: Int)
}

final class Member {
    static let limit = 2

    let name: String
    private(set) var borrowedIDs: [Int] = []

    init(name: String) {
        self.name = name
    }

    func recordBorrow(_ id: Int) throws {
        guard borrowedIDs.count < Member.limit else {
            throw LibraryError.limitReached(max: Member.limit)
        }
        borrowedIDs.append(id)
    }

    func recordReturn(_ id: Int) {
        borrowedIDs.removeAll { $0 == id }
    }
}

struct Catalog<Item: Borrowable> {
    private var items: [Int: Item] = [:]

    mutating func add(_ item: Item) {
        items[item.id] = item
    }

    mutating func checkout(id: Int, to member: Member) throws {
        guard var item = items[id] else {
            throw LibraryError.itemNotFound(id: id)
        }
        guard item.isAvailable else {
            throw LibraryError.alreadyBorrowed(title: item.title)
        }
        try member.recordBorrow(id)
        item.isAvailable = false
        items[id] = item
    }
}

func tryCheckout(_ catalog: inout Catalog<Book>, id: Int, to member: Member) {
    do {
        try catalog.checkout(id: id, to: member)
        print("\(member.name) borrowed item \(id)")
    } catch LibraryError.itemNotFound(let missingID) {
        print("Item \(missingID) was not found")
    } catch LibraryError.alreadyBorrowed(let title) {
        print("\"\(title)\" is already borrowed")
    } catch LibraryError.limitReached(let max) {
        print("\(member.name) reached the limit of \(max) items")
    } catch {
        print("Unexpected error: \(error)")
    }
}

var bookCatalog = Catalog<Book>()
bookCatalog.add(Book(id: 1, title: "Swift Programming", author: "Apple"))
bookCatalog.add(Book(id: 2, title: "Clean Code", author: "Robert Martin"))
bookCatalog.add(Book(id: 3, title: "Algorithms", author: "Sedgewick"))

let asha = Member(name: "Asha")

tryCheckout(&bookCatalog, id: 1, to: asha)
tryCheckout(&bookCatalog, id: 1, to: asha)
tryCheckout(&bookCatalog, id: 2, to: asha)
tryCheckout(&bookCatalog, id: 3, to: asha)
tryCheckout(&bookCatalog, id: 99, to: asha)

print("Asha's borrowed ids: \(asha.borrowedIDs)")

var magazineCatalog = Catalog<Magazine>()
magazineCatalog.add(Magazine(id: 10, title: "Tech Monthly", issue: 42))

let ravi = Member(name: "Ravi")
do {
    try magazineCatalog.checkout(id: 10, to: ravi)
    print("Ravi borrowed magazine 10")
} catch {
    print("Unexpected error: \(error)")
}
