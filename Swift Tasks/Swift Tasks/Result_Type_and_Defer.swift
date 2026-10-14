enum AgeError: Error {
    case empty
    case notANumber
    case outOfRange
}

enum ReportError: Error {
    case writeFailed
}

func parseAge(_ text: String) throws -> Int {
    if text.isEmpty {
        throw AgeError.empty
    }
    guard let age = Int(text) else {
        throw AgeError.notANumber
    }
    guard (1...120).contains(age) else {
        throw AgeError.outOfRange
    }
    return age
}

for text in ["25", "", "abc", "150"] {
    let result = Result { try parseAge(text) }
    switch result {
    case .success(let age):
        print("\"\(text)\" -> valid age \(age)")
    case .failure(let error):
        print("\"\(text)\" -> failed with \(error)")
    }
}

func saveReport(shouldFail: Bool = false) throws {
    print("Opening file")
    defer {
        print("Closing file")
    }
    if shouldFail {
        throw ReportError.writeFailed
    }
    print("Report written")
}

do {
    try saveReport()
} catch {
    print("Caught: \(error)")
}

print("")

do {
    try saveReport(shouldFail: true)
} catch {
    print("Caught: \(error)")
}
