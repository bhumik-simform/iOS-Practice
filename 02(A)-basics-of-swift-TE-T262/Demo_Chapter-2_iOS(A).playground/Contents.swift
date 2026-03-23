//import Foundation
//var num = 10
//var numDouble = 10.05
//
////var result = num + numDouble
//var float1 = 5.0/2
//var float2 = 5/2
//
//
//var result1 = 10 + 5 * 2
//var result2 = (10 + 5) * 2
//var result3 = 10 + (5 * 2)
//
//
//var str1 = "Swift"
//var str2 = "swift"
//let relStr = str1.caseInsensitiveCompare(str2) == .orderedSame
//print(relStr)
//
//
//print(UInt8.min)
//print(UInt8.max)
//var numx : UInt8 = 120 + 20
//
//
//var a = 10
//var b = 3
//a += b * 2 //Answer is 16 : * then +=
//b *= a - 5 // Answer is 33 not 45 why it is - then *=
//var c = a
//c %= 4
//
//
//
//let isVerified = true
//let hasPassword = false
//let allowLogin = isVerified && !hasPassword || true
//
//
//var  x = 0.1 + 0.2
//print(x==0.3)
//print(x)
//
//
//let totalQuestions = 50
//let correctAnswers = 25
//
////Goal: Calculate percentage (should be 50%)
//let percentage = (Double(correctAnswers) / Double(totalQuestions)) * 100
//
//
//let pi: Double = 3.14159
//var radius = 10.0
//// Swift infers 'radius' as Int because you didn't specify 10.0
//
//let area = pi * radius * radius
//
//let text = "Hii😅"
////var ch = text[3]
//print(text.count)

//let students = ["Alex", "Brian", "Alex", "Charlie", "David"]
//var studentSet: Set<String> = []
//
//// Move to Set
//for student in students {
//    studentSet.insert(student)
//}
//
//// Print
//for name in studentSet {
//    print(name)
//}

let serverResponse = (404, "Page Not Found")

switch serverResponse {
case (200, _):
    print("Success")
case (_, "Page Not Found"):
    print("Error: Missing Page")
case (400...500, _):
    print("General Error")
default:
     print("Unknown state")
}


//var taskQueue = ["Email", "Upload", "Log"]
//
//while !taskQueue.isEmpty {
//    let currentTask = taskQueue.first
//    print("Processing \(currentTask!)")
//    
//    if currentTask == "Upload" {
//        print("Upload failed, retrying...")
//        continue // Skip to next loop iteration to retry
//    }
//    
//    taskQueue.removeFirst()
//}
