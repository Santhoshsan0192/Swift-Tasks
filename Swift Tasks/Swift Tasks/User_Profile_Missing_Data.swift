struct Address {
    var city: String?
}

struct User {
    var name: String
    var age: Int?
    var address: Address?
}

func describe(_ user: User) -> String {
    guard let age = user.age else {
        return "\(user.name): age is unknown"
    }
    let city = user.address?.city ?? "unknown city"
    return "\(user.name), age \(age), lives in \(city)"
}

let complete = User(name: "Asha", age: 21, address: Address(city: "Chennai"))
let noAge = User(name: "Ravi", age: nil, address: Address(city: "Coimbatore"))
let noCity = User(name: "Meena", age: 22, address: Address(city: nil))

print(describe(complete))
print(describe(noAge))
print(describe(noCity))

let valid = Int("42")
let invalid = Int("abc")
print(valid as Any)
print(invalid as Any)
