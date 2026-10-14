class Box {
    deinit {
        print("Box gone")
    }
}

var a: Box? = Box()
var b = a
var c = a
a = nil
b = nil
print("before c")
c = nil
print("end")

print("")
print("Reference type | Use when")
print("strong         | Default. The owner must keep the object alive.")
print("weak           | The other object may outlive this reference or become nil. Must be an optional var. Use for delegates and parent links.")
print("unowned        | The other object always outlives this reference and is never nil. Not optional, crashes if used after the object is freed.")
