import Foundation

print("Compiler errors in the original code:")
print("1. 'let price = 250' is a constant, so 'price = 300' is an error: cannot assign to value 'price' which is a 'let' constant. Fix: declare price with var.")
print("2. 'price * quantity * taxRate' multiplies Int values by a Double, and Swift never converts types implicitly: binary operator '*' cannot be applied to operands of type 'Int' and 'Double'. Fix: convert with Double(price * quantity).")
print("3. 'var title = \"Order\"' is inferred as String, so 'title = 42' is an error: cannot assign value of type 'Int' to type 'String'. Fix: assign a String value.")
print("")

var price = 250
var quantity: Int = 3
let taxRate = 0.18
price = 300
let subtotal = Double(price * quantity)
let total = subtotal * (1 + taxRate)
var title = "Order"
title = "Order 42"

print(title)
print("Subtotal: \(String(format: "%.2f", subtotal))")
print("Total including tax: \(String(format: "%.2f", total))")
