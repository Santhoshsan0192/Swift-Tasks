import Foundation

let itemPrice = 450.0
let quantity = 3
let subtotal = itemPrice * Double(quantity)

let hasCoupon = true
let discount = (hasCoupon && subtotal > 1000) ? subtotal * 0.10 : 0.0
let discountedAmount = subtotal - discount

let gst = discountedAmount * 0.18
let total = discountedAmount + gst

let people = 4
let share = total / Double(people)

print("Subtotal: \(String(format: "%.2f", subtotal))")
print("Discount: \(String(format: "%.2f", discount))")
print("GST: \(String(format: "%.2f", gst))")
print("Total: \(String(format: "%.2f", total))")
print("Each person pays: \(String(format: "%.2f", share))")

let amount = 1234
let hundreds = amount / 100
let remainder = amount % 100
print("\(amount) rupees = \(hundreds) hundreds and \(remainder) rupees remaining")
