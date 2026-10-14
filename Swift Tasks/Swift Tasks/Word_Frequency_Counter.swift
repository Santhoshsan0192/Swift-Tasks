let sentence = "swift is fun and swift is fast"
let words = sentence.split(separator: " ").map { String($0) }

print("Number of words: \(words.count)")

let uniqueWords = Set(words)
print("Unique words: \(uniqueWords.sorted())")

var frequency: [String: Int] = [:]
for word in words {
    frequency[word, default: 0] += 1
}

print("Frequencies:")
for (word, count) in frequency.sorted(by: { $0.key < $1.key }) {
    print("\(word): \(count)")
}

let ranked = frequency.sorted { first, second in
    if first.value != second.value {
        return first.value > second.value
    }
    return first.key < second.key
}

print("Ranked by frequency:")
for (word, count) in ranked {
    print("\(word): \(count)")
}
