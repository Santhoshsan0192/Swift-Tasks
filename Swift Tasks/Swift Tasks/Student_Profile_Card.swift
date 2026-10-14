let studentName = "Nandhakumar"
let rollNumber: Int = 2301
var semester = 5
var cgpa: Double = 8.2
let isHosteller = true

print("Name: \(studentName), Roll: \(rollNumber), Semester: \(semester)")

semester += 1
cgpa = 8.5

print("Name: \(studentName), Roll: \(rollNumber), Semester: \(semester), CGPA: \(cgpa)")

print("studentName: \(type(of: studentName))")
print("rollNumber: \(type(of: rollNumber))")
print("semester: \(type(of: semester))")
print("cgpa: \(type(of: cgpa))")
print("isHosteller: \(type(of: isHosteller))")
