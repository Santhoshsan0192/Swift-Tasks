import Foundation

protocol Payable {
    var name: String { get }
    func monthlyPay() -> Double
}

extension Payable {
    func payslip() -> String {
        let amount = String(format: "%.2f", monthlyPay())
        return "Payslip - \(name): Rs. \(amount)"
    }
}

struct FullTimeEmployee: Payable {
    let name: String
    let annualSalary: Double

    func monthlyPay() -> Double {
        annualSalary / 12
    }
}

struct Intern: Payable {
    let name: String
    let monthlyStipend: Double

    func monthlyPay() -> Double {
        monthlyStipend
    }
}

struct Contractor: Payable {
    let name: String
    let hourlyRate: Double
    let hours: Double

    func monthlyPay() -> Double {
        hourlyRate * hours
    }
}

let staff: [any Payable] = [
    FullTimeEmployee(name: "Asha", annualSalary: 900000),
    Intern(name: "Ravi", monthlyStipend: 15000),
    Contractor(name: "Meena", hourlyRate: 500, hours: 120)
]

for person in staff {
    print(person.payslip())
}
