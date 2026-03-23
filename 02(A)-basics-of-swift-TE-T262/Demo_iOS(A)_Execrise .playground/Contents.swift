let schoolName : String = "High School"

var studentGrade : [String : Int?] = ["Rakesh":45 , "Raju": nil]
studentGrade["Ritika"] = 78
studentGrade["Ramesh"] = 65
studentGrade.count
print("--------Scorecard of School--------")
for(student,score) in studentGrade {
    if let score {
        print("Student: \(student), marks: \(score)")
    } else {
        let displayScore = score ?? 0
        print("Student: \(student) Marks: 0. Exam missed.")
    }
}

print("--------Grade Report--------")
for(student,score) in studentGrade {
    switch score ?? -1 {
    case 90...100: print("Student: \(student) Grade: A")
    case 80...89:  print("Student: \(student) Grade: B")
    case 70...79:  print("Student: \(student) Grade: C")
    case 0...69:   print("Student: \(student) Grade: F")
    case -1 :      print("Student: \(student) was absent Grade: F")
    default:       print("Invalid Score")
    }
}

print("--------Retake Exam List--------")
var flagedStudent : [String] = []
for(student,score) in studentGrade {
    if (score ?? 0) < 70 {
        flagedStudent.append(student)
    }
}
for idx in 0..<flagedStudent.count {
    print(flagedStudent[idx])
}



//Execrise 2
var coustmerAddresses : [String : String?] = ["Jayesh":"London" , "Rakesh":"New York" , "Suresh":nil]


func calculateShipping(city: String?) -> Double {
    guard let city else {
        return 0.0
    }
    switch city {
    case "London": return 5.99
    case "New York": return 9.99
    default: return 15.99
    }
}


var priorityOrder : [String] = ["Jayesh" , "Suresh" , "Rakesh"]
for customer in priorityOrder  {
    if let cityName = coustmerAddresses[customer] {
        let cost = calculateShipping(city: cityName)
        print("Coustmer \(customer) form \(cityName ?? "No City") costs $\(cost)")
    }
}


//OTHER LINE
var specialInstructions: String? = "Leave at the front door"
print(specialInstructions?.count ?? 0)

