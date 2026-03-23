import UIKit

var greeting = "Hello, playground"

var username: String? = "SwiftLearner_99"
var bio: String? = nil
var profilePictureUrl: String? = "https://example.com/photo.jpg"

// optional binding
if let printUsername = username {
    print("Hello \(printUsername)") //or use (username!) or (username ?? " ")
} else {
    print("Name don`t exist")
}

//nil coalescing
let displayBio = bio ?? "no bio"

//force unrapping never do this
//print(profilePictureUrl!)


var bookTitle: String? = "The Swift Saga"
var authorName: String? = nil
var pageCount: Int? = 420
var libraryBranch : String? = nil
if let bookTitle {
    print("reading book : \(bookTitle)")
}
var finalAuthor = authorName ?? "UNkown Author"
 print("This book has \(pageCount!) pages")
