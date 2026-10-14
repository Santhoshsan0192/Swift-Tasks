extension Int {
    var isEven: Bool {
        self % 2 == 0
    }

    func squared() -> Int {
        self * self
    }
}

extension Array where Element == Int {
    var sum: Int {
        reduce(0, +)
    }
}

extension String {
    var wordCount: Int {
        split(whereSeparator: { $0.isWhitespace }).count
    }
}

struct Version: Comparable {
    let major: Int
    let minor: Int

    static func < (lhs: Version, rhs: Version) -> Bool {
        if lhs.major != rhs.major {
            return lhs.major < rhs.major
        }
        return lhs.minor < rhs.minor
    }
}

print("4.isEven: \(4.isEven)")
print("7.isEven: \(7.isEven)")
print("6.squared(): \(6.squared())")
print("[1, 2, 3, 4].sum: \([1, 2, 3, 4].sum)")
print("\"Swift is really fun\".wordCount: \("Swift is really fun".wordCount)")

print("1.9 < 2.0: \(Version(major: 1, minor: 9) < Version(major: 2, minor: 0))")

let versions = [
    Version(major: 2, minor: 1),
    Version(major: 1, minor: 9),
    Version(major: 2, minor: 0),
    Version(major: 1, minor: 2)
]

for version in versions.sorted() {
    print("\(version.major).\(version.minor)")
}
