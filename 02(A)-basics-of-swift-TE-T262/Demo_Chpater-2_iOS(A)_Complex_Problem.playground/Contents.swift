//Exercise 1 

//let travelLogs = [
//    "Aarav,Mumbai,Sunny",
//    "Aarav,Delhi,Sunny",
//    "Aarav,Bangalore,Cloudy",
//    "Aarav,Ahmedabad,Sunny",
//    "Priya,Surat,Rainy",
//    "Priya,Surat,Rainy",
//    "Priya,Surat,Rainy",
//    "Ishaan,Chennai,Sunny",
//    "Ishaan,Chennai,Rainy"
//]
//
//struct travelSummary {
//    let reason : String
//    let uniqueCities : Int
//    let raniyDays : Int
//}
//func findTravelerType (travelData : [String]) -> [String:travelSummary] {
//    var tempData = [String:(cities : Set<String>,rainCount : Int)]()
//    for singleData in travelData {
//        let components = singleData.split(separator: ",")
//        let name = String(components[0])
//        let city = String(components[1])
//        let weather = String(components[2])
//        if tempData[name] != nil {
//            tempData[name]?.cities.insert(city)
//            if(weather=="Rainy") {
//                tempData[name]?.rainCount+=1
//            }
//        } else {
//            tempData[name] = (cities : Set([city]), weather=="Rainy" ? 1:0)
//        }
//    }
//    var result = [String : travelSummary] ()
//    for(name,(cities,raincount)) in tempData {
//        if (cities.count > 2 && raincount > 2) {
//            result[name] = travelSummary(reason: "Frequent Flyer and Rain Megnet", uniqueCities: cities.count, raniyDays: raincount)
//        } else if cities.count > 2 {
//            result[name] = travelSummary(reason: "Frequent Flyer", uniqueCities: cities.count, raniyDays: raincount)
//        } else if raincount > 2 {
//            result[name] = travelSummary(reason: "Rain Megnet", uniqueCities: cities.count, raniyDays: raincount)
//        }
//    }
//    return result
//}
//
//let result = findTravelerType(travelData: travelLogs)
//for (name,summary) in result {
//    print("\(name) is a \(summary.reason)! Cities visited: \(summary.uniqueCities), with Rain Days: \(summary.raniyDays)")
//}
//    
////Assignment 2
//
//
//let rawTransactions = [
//    "2026-02-01,Food,500",
//    "2026-02-02,Rent,15000",
//    "2026-02-03,Food,700",
//    "2026-02-04,Entertainment,2000",
//    "2026-02-05,Food,100",
//    "2026-02-06,Entertainment,5000",
//    "2026-02-07,Travel,1200"
//]
//
//let budgetLimits = [
//    "Food": 1000,
//    "Rent": 20000,
//    "Entertainment": 4000,
//    "Travel": 2000
//]
//
//struct OverFlowData {
//    let spent : Int
//    let limit : Int
//    let overflow : Int
//}
//func budgetOverfFlawFinder (transections :  [String], budgetLimit: [String : Int]) ->  [String : OverFlowData] {
//    var tempBudgetReport = [String : Int]()
//    for rawTransaction in rawTransactions {
//        let components = rawTransaction.split(separator: ",")
//        guard  components.count == 3 else {continue}
//        let category = String(components[1])
//        let spent = Int(components[2]) ?? 0
//        tempBudgetReport[category, default: 0] += spent
//    
//    }
//    
//    var result = [String : OverFlowData] ()
//    for(category,spent) in tempBudgetReport {
//        if(budgetLimit.keys.contains(category)) {
//            let spent = tempBudgetReport[category] ?? 0
//            let limit = budgetLimit[category] ?? 0
//            if spent-limit > 0 {
//                result[category] = OverFlowData(spent: spent, limit: limit, overflow: (spent-limit))
//            }
//        }
//    }
//    return result
//}
//
//
//let finalReport = budgetOverfFlawFinder(transections: rawTransactions, budgetLimit: budgetLimits)
//for(category,overFlawData) in finalReport {
//    print("\(category): [Spent: \(overFlawData.spent), Limit: \(overFlawData.limit), Overflow: \(overFlawData.overflow)]")
//}


////Assignment 3
//
//let songLibrary = [
//    ["title": "Starboy", "artist": "The Weeknd", "genre": "Pop", "duration": "230"],
//    ["title": "Blinding Lights", "artist": "The Weeknd", "genre": "Pop", "duration": "200"],
//    ["title": "Do I Wanna Know?", "artist": "Arctic Monkeys", "genre": "Rock", "duration": "270"],
//    ["title": "R U Mine?", "artist": "Arctic Monkeys", "genre": "Rock", "duration": "201"],
//    ["title": "Creep", "artist": "Radiohead", "genre": "Alternative", "duration": "238"],
//    ["title": "Humble", "artist": "Kendrick Lamar", "genre": "Hip-Hop", "duration": "177"]
//]
//
//
//
//func playlistGenrater(songLibrary : [[String:String]]) -> [String : [String]] {
//    var tempList = [String : (genre : String, songsTitles : [String] ) ] ()
//    for song in songLibrary {
//        let duration = Int(song["duration" , default: "0"]) ?? 0
//        let artist = song["artist" , default: "Unknow"]
//        let title = song["title" , default: "Unknow"]
//        let genre = song["genre" , default: "Unknow"]
//        if duration<240 {
//            if var songInfo = tempList[artist] {
//                songInfo.songsTitles.append(title)
//                tempList[artist] = songInfo
//            } else {
//                tempList[artist] = (genre : genre , songsTitles : [title])
//            }
//        }
//    }
//    var result = [String : [String]] ()
//    for (artist,artistInfo) in tempList{
//        if artistInfo.songsTitles.count > 1 {
//            result["\(artist)(\(artistInfo.genre))"] = artistInfo.songsTitles
//        } else {
//            result[artist] = artistInfo.songsTitles
//        }
//    }
//    return result
//}
//
//let finalList = playlistGenrater(songLibrary: songLibrary)
//for (artist, songs) in finalList {
//    print("Artist: \(artist) | Songs: \(songs)")
//}


//// Assignment 4
//
//let currentInventory = [
//    "IPH-15": 10,
//    "MAC-M3": 5,
//    "WCH-S9": 20
//]
//
//let incomingShipment = [
//    "IPH-15,Add,5",       // Regular addition
//    "IPH-15,Damage,-2",   // Subtracting damaged goods
//    "MAC-M3,Add,2",       // Regular addition
//    "AIR-PRO,New,15",     // A brand new item not in inventory
//    "WCH-S9,Add,0",       // No change
//    "UNK-99,Damage,-1"    // Error case: Damaging an item we don't even have
//]
//
//
//func inventroyUpdater ( currentInventroy: [String : Int], upcomingShipment : [String] ) -> (updatedInvetory : [String : Int] , errorLog : [String]) {
//    var temp = currentInventroy
//    var errorLog = [String] ()
//    for item in upcomingShipment {
//        var components = item.split(separator: ",")
//        var itemID = String(components[0])
//        var action = String(components[1])
//        var quantity = Int(String(components[2]))
//        switch action {
//            case "Add" , "New" : temp[itemID, default: 0] += quantity ?? 0
//            case "Damage":
//                if temp[itemID] == nil {
//                    errorLog.append("Error: Cannot damage unknown item \(itemID)")
//                } else {
//                    temp[itemID] = max(temp[itemID,default: 0] + (quantity ?? 0) , 0)
//                }
//            
//            default: print("Invalid Action")
//        }
//    }
//    let result = (temp, errorLog)
//    return result
//}
//
//let finalInventory = inventroyUpdater(currentInventroy: currentInventory, upcomingShipment: incomingShipment)
//print(finalInventory.updatedInvetory)
//print(finalInventory.errorLog)


//Assignment 5

////Input
//let rawSettings: [String: Any] = [
//    "username": "Rudra_Dev",
//    "isDarkMode": true,
//    "maxHistoryDays": 30,
//    "currencySymbol": "₹",
//    "alertThreshold": 5000.50,
//    "backupEnabled": "false", // Note: This is a string, but it should be a Bool!
//    "themeColors": ["Blue", "DarkGray", "White"] // An array inside Any
//]
//
//// Expected Output
////Username set to: Rudra_Dev
////Mode: Dark Mode Enabled
////History: 30.0 days (Converted to Double)
////Threshold: 5000.5
////Backup: False (Fixed from String)
////Theme Count: 3 colors found
//
//
//struct CleanSetting {
//    var username : String = ""
//    var isDarkMode : Bool = false
//    var maxHistoryDays : Double = 0.0
//    var currecySymbol : String = ""
//    var alertThreshold : Double = 0.0
//    var backupEnabled : Bool = false
//    var numberOfThemeColors : Int = 0
//}
//
//func rawToCleanSettingsConverter (rawSettings : [String : Any]) -> CleanSetting {
//    var cleanSetting = CleanSetting()
//    for (key,value) in rawSettings {
//        switch value {
//        case let someInt as Int :
//            if key == "maxHistroyDays" {cleanSetting.maxHistoryDays = Double(someInt)}
//        case let someDouble as Double:
//            if key == "alertThreshold" {cleanSetting.alertThreshold = someDouble}
//        case let someString as String:
//            if key == "username" {cleanSetting.username = someString}
//            else if key == "currencySymbol" {cleanSetting.currecySymbol = someString}
//            else if key == "backupEnabled"  {cleanSetting.backupEnabled = (Bool(someString) ?? false) }
//        case let someBool as Bool:
//            if key == "isDarkMode" {cleanSetting.isDarkMode = someBool}
//        case let someArr as [String]:
//            if key == "themeColors"{cleanSetting.numberOfThemeColors = someArr.count}
//        default: continue
//            
//        }
//    }
//    return cleanSetting
//}
//
//print(rawToCleanSettingsConverter(rawSettings: rawSettings))


//Assignment 6

// Input
let complexTransactions: [[String: Any]] = [
    ["category": "Food", "amount": 1200, "meta": ["location": "Zomato", "refund": 200]],
    ["category": "Rent", "amount": 15000],
    ["category": "Food", "amount": 500, "meta": ["location": "Swiggy"]],
    ["category": "Travel", "amount": 2000, "meta": ["refund": 500, "isBusiness": true]],
    ["category": "Entertainment", "amount": "1000"] // Note: Amount is a String here!
]

// Expected Output
//[
//    "Food": 1500,         // (1200 - 200) + 500
//    "Rent": 15000,
//    "Travel": 1500,       // 2000 - 500
//    "Entertainment": 1000 // Converted from String "1000"
//]

func totalCalculator(transections : [[String : Any]]) -> [String : Int] {
    var result = [String : Int] ()
    // My solution
//    for transaction in transections {
//        var tempCategory : String = transaction["category"] as? String ?? ""
//        var tempAmount : Int = transaction["amount"] as? Int ?? (Int(transaction["amount"] as? String ?? "0") ?? 0)
//        var tempMeta : [String : Any]? = transaction["meta"] as? [String : Any]
//        
//        if result.keys.contains(tempCategory) {
//            result[tempCategory, default: 0] += tempAmount
//            if tempMeta != nil {
//                if let refundAmount = tempMeta?["refund"] {
//                    result[tempCategory, default: 0] -= refundAmount as? Int ?? 0
//                }
//            }
//        } else {
//            result[tempCategory,default: 0] = tempAmount
//            if tempMeta != nil {
//                if let refundAmount = tempMeta?["refund"] {
//                    result[tempCategory, default: 0] -= refundAmount as? Int ?? 0
//                }
//            }
//            
//        }
//            
//    }
    
    
    // Best Solution
    for transaction in transections {
        let category = transaction["category"] as? String ?? "Uncategories"
        let tempAmount = transaction["amount"] as? Int ?? Int(transaction["amount"] as? String ?? "0") ?? 0
        
        result[category, default: 0] += tempAmount
        
        if let tempMeta = transaction["meta"] as? [String : Any], let refund = tempMeta["refund"] as? Int {
            result[category, default: 0] -= refund
        }
    }
    return result
}


print(totalCalculator(transections: complexTransactions))
