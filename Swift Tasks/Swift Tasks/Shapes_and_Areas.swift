enum Shape {
    case circle(radius: Double)
    case rectangle(width: Double, height: Double)
    case triangle(base: Double, height: Double)

    var area: Double {
        switch self {
        case .circle(let radius):
            return Double.pi * radius * radius
        case .rectangle(let width, let height):
            return width * height
        case .triangle(let base, let height):
            return 0.5 * base * height
        }
    }
}

struct Rectangle {
    var width: Double
    var height: Double

    var perimeter: Double {
        2 * (width + height)
    }

    mutating func scale(by factor: Double) {
        width *= factor
        height *= factor
    }
}

let shapes: [Shape] = [
    .circle(radius: 3),
    .rectangle(width: 4, height: 5),
    .triangle(base: 6, height: 2)
]

for shape in shapes {
    print("Area: \(shape.area)")
}

let original = Rectangle(width: 4, height: 3)
var scaledCopy = original
scaledCopy.scale(by: 2)

print("Original: \(original.width) x \(original.height), perimeter \(original.perimeter)")
print("Scaled copy: \(scaledCopy.width) x \(scaledCopy.height), perimeter \(scaledCopy.perimeter)")
