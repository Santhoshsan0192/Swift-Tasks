func isPalindrome(_ text: String) -> Bool {
    let cleaned = text.lowercased().filter { $0.isLetter || $0.isNumber }
    return cleaned == String(cleaned.reversed())
}

func vowelCount(in text: String) -> Int {
    text.lowercased().filter { "aeiou".contains($0) }.count
}

func wordCount(in text: String) -> Int {
    text.split(whereSeparator: { !$0.isLetter }).count
}

func wordCount(in text: String, minLength: Int) -> Int {
    text.split(whereSeparator: { !$0.isLetter }).filter { $0.count >= minLength }.count
}

let sample = "A man, a plan, a canal: Panama"

print("Is palindrome: \(isPalindrome(sample))")
print("Is palindrome (Swift): \(isPalindrome("Swift"))")
print("Vowel count: \(vowelCount(in: sample))")
print("Word count: \(wordCount(in: sample))")
print("Words with at least 4 letters: \(wordCount(in: sample, minLength: 4))")
