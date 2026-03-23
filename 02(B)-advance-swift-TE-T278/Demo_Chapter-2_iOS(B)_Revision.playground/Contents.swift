print("------------- Problem - 1 -------------")
enum AccessLevel {
    case resitricted
    case standard
    case admin
}

struct VaultItem {
    var id : String
    var name : String
    var accessLevel : AccessLevel
    
    var description : String {
        "Name: \(self.name) Access Level: \(self.accessLevel)"
    }
    
}

class Vault {
    var history : [String:VaultItem] = [:]
    var lastAccessedItemName : VaultItem? {
        didSet {
            print("Last AccessedItem is \(lastAccessedItemName?.id ?? "None") ")
        }
    }
    
}


print("------------- Problem - 2 -------------")
class TaskProcessor {
    
    enum ProcessingError : Error {
            case emptyData
            case invalidFormat(_ currentProcess: String)
    }
    
    func processTask(processTasksList: [String], fiterClosure : (String) -> Bool) throws -> [String] {
        if processTasksList.isEmpty { throw ProcessingError.emptyData }
        let resultList = processTasksList.filter(fiterClosure)
        return resultList
    }
}


let processList = ["Run","Go","Sleep","Code","Hm","O"]
let processor1 = TaskProcessor()
do {
    try processor1.processTask(processTasksList: processList , fiterClosure: {$0.count < 3} )
} catch TaskProcessor.ProcessingError.emptyData {
    print("Error: The process is empty.")
} catch TaskProcessor.ProcessingError.invalidFormat(let currentProcess) {
    print("Error: Invalid formate your process is \(currentProcess)")
} catch {
    print("Error: Unexpected Error Occured \(error)")
}

print("------------- Problem - 3 -------------")
class Employee {
    var name: String
    
   init(name: String) {
        self.name = name
    }
    
    func work() {
        print("\(name) is working.")
    }
}

class Manager: Employee {
    weak var department: Department?
    override func work() {
        print("\(name) is managing the team.")
    }
    deinit {
        print("\(name) fired from manager post.")
    }
}

class Department {
    weak var manager: Manager?
    deinit {
        print("Department is Closed")
    }
}

print("------------- Problem - 4 -------------")
class Library {
    private(set) var books = [Any]()
    
    subscript(_ idx: Int) -> Any? { books.indices.contains(idx) ? books[idx] : nil }
    
    func printBookTitle() {
        for book in books {
            guard let title = book as? String else {
                continue
            }
            print(title)
        }
    }
}

var myLib: Library? = Library()
myLib?.printBookTitle()

print("------------- Problem - 5 -------------")

protocol NetworkDelegate: AnyObject {
    func didFetchData(_ data: String)
}

class NetworkManager {
    weak var delegate: NetworkDelegate?
    func fetchData() {
        delegate?.didFetchData("Successfully retrieved user profile")
    }
}

class ViewController: NetworkDelegate {
    func didFetchData(_ data: String) {
        print(data)
        print("Sucess: \(data.isSuccessMessage())")
    }
}

extension String {
    func isSuccessMessage() -> Bool {
        self.contains("SucessFully")
    }
}

print("------------- OG Problem -------------")
struct TrackSetup {
    
    enum SetupError: Error {
        case pressureTooLow
        case negativeValue
    }
    
    var frontTirePressure: Double {
        didSet {
            if(frontTirePressure < 20) { print("Front Tyre Pressure is Low.") }
        }
    }
    var rearTirePressure: Double {
        didSet {
            if(frontTirePressure < 20) { print("Front Tyre Pressure is Low.") }
        }
    }
    
    init(frontTirePressure: Double, rearTirePressure: Double) throws {
        
        if frontTirePressure<0 || rearTirePressure<0 { throw SetupError.negativeValue }
        
        self.frontTirePressure = frontTirePressure
        self.rearTirePressure = rearTirePressure

    }
}

class Motorcycle {
    var make: String
    var model: String
    var nickName: String
    var trackSetups: [TrackSetup]
    weak var owner: Rider?
    
    init(make: String, model: String, nickName: String, trackSetups: [TrackSetup] = [TrackSetup]()) {
        self.make = make
        self.model = model
        self.trackSetups = trackSetups
    }
    
    deinit {
        print("\(model) is disowned by \(owner?.name ?? "Somebody")")
    }
    
    func getDetails() {
        print("Make: \(make) Model: \(model) Nick Name: \(nickName)")
        print("Track Setups:")
        trackSetups.forEach {trackSetup in
            print("[",terminator: " ")
            print("Front Tyre Pressure: \(trackSetup.frontTirePressure) PSI", terminator: " ")
            print("Rear Tyre Pressure: \(trackSetup.rearTirePressure) PSI", terminator: " ")
            print("],")
        }
    }
    
}


class TrackMotorcycle: Motorcycle {
    var hasSlicks: Bool
    init (make: String, model: String, nickName: String, trackSetups: [TrackSetup] = [], hasSlicks: Bool) {
        self.hasSlicks = hasSlicks
        super.init(make: make, model: model, nickName: nickName, trackSetups: trackSetups)
    }
    
    override func getDetails() {
        print("Make: \(make) Model: \(model) NickName: \(nickName) Has Slicks: \(hasSlicks ? "Yes":"No")")
        print("Track Setups:")
        trackSetups.forEach { trackSetup in
            print("[",terminator: " ")
            print("Front Tyre Pressure: \(trackSetup.frontTirePressure) PSI", terminator: " ")
            print("Rear Tyre Pressure: \(trackSetup.rearTirePressure) PSI", terminator: " ")
            print("]")
        }
    }
}


class Rider {
    var name : String
    var motorcycles : [Motorcycle?]
    
    init(name: String, motorcycles: [Motorcycle] = [] ) {
        self.name = name
        self.motorcycles = motorcycles
    }
    
    subscript(nickName: String) -> Motorcycle? {
        let result = motorcycles.first(where: {$0?.nickName == nickName})
        return result ?? nil
    }
    
    func sellTheMotorcycle(_ motorcycle: Motorcycle) {
        for motorcycle in motorcycles {
            
        }
    }
}

protocol SetupUpdateDelegate {
    func didUpdateSetup(for bikeModel: String)
}
