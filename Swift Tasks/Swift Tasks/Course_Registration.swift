var subjects = ["Swift", "UIKit", "SwiftUI"]
subjects.append("Networking")
subjects.insert("Testing", at: 1)
if let index = subjects.firstIndex(of: "UIKit") {
    subjects.remove(at: index)
}
print(subjects.sorted())

var registered: Set<String> = ["Asha", "Ravi"]
registered.insert("Meena")
registered.insert("Meena")
print(registered.count)

var marks: [String: Int] = ["Asha": 82, "Ravi": 35, "Meena": 91]
marks["Kiran"] = 56
marks["Ravi"] = 48
if let divyaMark = marks["Divya"] {
    print("Divya: \(divyaMark)")
} else {
    print("Divya is not in the dictionary")
}

for (name, mark) in marks.sorted(by: { $0.key < $1.key }) {
    print("\(name): \(mark)")
}

if let top = marks.max(by: { $0.value < $1.value }) {
    print("Highest mark: \(top.value) by \(top.key)")
}
