import Foundation

////Execrise 1
//print("------------- Exercise-1 -------------")
//class MediaItem {
//    let name : String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class Movie: MediaItem {
//    let director : String
//    init(name : String, director: String) {
//        self.director = director
//        super.init(name: name)
//    }
//}
//
//class Song : MediaItem {
//    let artist : String
//    init(name : String, artist: String) {
//        self.artist = artist
//        super.init(name: name)
//    }
//}
//
//struct PlayList {
//    var items : [MediaItem] = []
//    
//    subscript(_ index : Int)-> MediaItem? {
//        get {
//            if items.indices.contains(index) { return items[index] }
//            return nil
//        } set {
//            guard let newValue = newValue else {return}
//            
//            if index < 0 {
//                print("Enter Valid Index")
//                return
//            } else if !items.indices.contains(index) {
//                print("Use append to add new item in list.")
//                return
//            }
//            
//            items[index] = newValue
//        }
//    }
//}
//
//let library = PlayList(items:
//[
//    Movie(name: "Inception", director: "Cristopher Nolan"),
//    Song(name: "Do I wann Know?", artist: "Arctic Monkeys"),
//    Movie(name: "Superman", director: "James Gunn"),
//    Song(name: "My Eyes", artist: "Travis Scott"),
//    Song(name: "Love Story", artist: "Taylor Swift")
//] )
//for i in 0..<library.items.count {
//    if let movie = library[i] as? Movie {
//        print("Watching \(movie.name) directed by \(movie.director)")
//    }else if let song = library[i] as? Song {
//        print("Listing \(song.name) by \(song.artist)")
//    }
//}
//
//print("------------- Exercise-2 -------------")
//class MotorCycle {
//    enum EngineType : String {
//        case cruiser
//        case sports
//        case standard
//    }
//    
//    struct Specs {
//        let cc : Int
//        let weight : Int
//    }
//    
//    var name : String
//    var engine : EngineType
//    var details : Specs
//    
//    init(name : String, engine: EngineType, details: Specs) {
//        self.name = name
//        self.engine = engine
//        self.details = details
//    }
//}
//let meteor = MotorCycle(name: "Meteor",engine: .cruiser , details: MotorCycle.Specs(cc: 350, weight: 172))
//print("MotorCycle: \(meteor.name)")
//print("Engine Type: \(meteor.engine.rawValue)")
//print("Details: Engine Size is \(meteor.details.cc) cc and Weight is \(meteor.details.weight)kgs.")
//print("------------- Exercise-3 -------------")
//
//extension String {
//    var length: Int {return self.count}
//    subscript(index : Int)-> Character? {
//        if 0<=index && index<self.count {
//            let idx = self.index(self.startIndex, offsetBy: index)
//            return self[idx]
//        }
//        return nil
//    }
//}
//let text = "Developers"
//print(text.length)
//print(text[3] ?? "Invalid Index")


print("------------- Exercise-4 -------------")
extension String {
    var secureURL : String {
        if self.hasPrefix("http://") {
            return self.replacingOccurrences(of: "http://", with: "https://")
        }
        return self
    }
}

@MainActor
class ImageManager {
    var storage : [String : String] = [:]
    
    subscript (url: String)-> String? {
        get { return storage[url] }
        set {storage[url] = newValue }
    }
    
    func fetchImage (url : String, completion: @escaping (String)->Void) {
        var safeURL = url.secureURL
        if let cachedData = storage[safeURL] {
            completion(cachedData)
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            let newData = "image data for \(safeURL)"
            self[safeURL] = newData
            completion(newData)
        }
    }
}

let manager = ImageManager()
manager.fetchImage(url: "http://mysite.com/pic.png") { data in
    print("Received: \(data)")
 }


print("------------- Exercise-5 -------------")
typealias Validator = (String)->Bool

class FormValidator {
    var rules : [String : Validator]
    init(ruleList : [String : Validator] = [:]) {
        print("RuleList is created to store rules for fieldID")
        self.rules = ruleList
    }
    subscript(fieldID : String) -> Validator? {
        get {
            guard let validatorRule = rules[fieldID] else {
                return nil
            }
            return validatorRule
        } set {
            rules[fieldID] = newValue
        }
    }
}

extension String {
    func isValid (usingRule : Validator) -> Bool {
        usingRule(self)
    }
}

let validator = FormValidator()
validator["password"] = {
    $0.count > 8
}

let tempPassword = "Bhumik"
if let rule = validator["password"] {
    print(tempPassword.isValid(usingRule: rule))
}

