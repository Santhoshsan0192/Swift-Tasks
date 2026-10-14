func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}

let a = makeCounter()
let b = makeCounter()
print(a(), a(), b(), a())

print("")
print("Why a and b do not interfere: every call to makeCounter() creates a new count variable. Each returned closure captures its own copy of that variable, which lives on the heap as long as the closure exists.")
