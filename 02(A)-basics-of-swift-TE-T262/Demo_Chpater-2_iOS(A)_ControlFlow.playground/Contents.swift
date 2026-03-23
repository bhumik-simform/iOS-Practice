import UIKit

var firstName = "Hello"

var setNum : Set<Int> = [1,2,3,4,2]

for num in setNum {
    print(num)
}


var taskQueue = ["Email", "Upload", "Log"]

while !taskQueue.isEmpty {
    let currentTask = taskQueue.first
    print("Processing \(currentTask!)")
    
    if currentTask == "Upload" {
        print("Upload failed, retrying...")
        continue // Skip to next loop iteration to retry
    }
    
    taskQueue.removeFirst()
}
