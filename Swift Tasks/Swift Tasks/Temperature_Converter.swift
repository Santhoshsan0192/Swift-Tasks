import Foundation

let nine = 9.0
let five = 5.0
let fahrenheitOffset = 32.0
let kelvinOffset = 273.15

func printConversions(for celsius: Double) {
    let fahrenheit = celsius * nine / five + fahrenheitOffset
    let kelvin = celsius + kelvinOffset
    print("Celsius: \(String(format: "%.1f", celsius))")
    print("Fahrenheit: \(String(format: "%.1f", fahrenheit))")
    print("Kelvin: \(String(format: "%.1f", kelvin))")
}

var celsius = 36.6
printConversions(for: celsius)

celsius = 100.0
printConversions(for: celsius)
