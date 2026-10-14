enum ATMError: Error {
    case insufficientFunds(shortBy: Double)
    case invalidAmount
    case dailyLimitExceeded
}

struct Account {
    var balance: Double
    let dailyLimit = 20000.0

    mutating func withdraw(_ amount: Double) throws {
        guard amount > 0 else {
            throw ATMError.invalidAmount
        }
        guard amount <= dailyLimit else {
            throw ATMError.dailyLimitExceeded
        }
        guard amount <= balance else {
            throw ATMError.insufficientFunds(shortBy: amount - balance)
        }
        balance -= amount
    }
}

func attempt(_ amount: Double, on account: inout Account) {
    do {
        try account.withdraw(amount)
        print("Withdrew \(amount). New balance: \(account.balance)")
    } catch ATMError.invalidAmount {
        print("Cannot withdraw \(amount): invalid amount")
    } catch ATMError.dailyLimitExceeded {
        print("Cannot withdraw \(amount): daily limit of 20000 exceeded")
    } catch ATMError.insufficientFunds(let shortBy) {
        print("Cannot withdraw \(amount): insufficient funds, short by \(shortBy)")
    } catch {
        print("Unexpected error: \(error)")
    }
}

var account = Account(balance: 10000)

attempt(500, on: &account)
attempt(-10, on: &account)
attempt(25000, on: &account)
attempt(15000, on: &account)

let succeeded = (try? account.withdraw(200)) != nil
print("Withdrawal of 200 worked: \(succeeded)")

let failed = (try? account.withdraw(50000)) != nil
print("Withdrawal of 50000 worked: \(failed)")
print("Final balance: \(account.balance)")
