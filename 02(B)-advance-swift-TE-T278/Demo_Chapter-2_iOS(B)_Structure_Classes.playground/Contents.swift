struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let hd = Resolution(width: 1940, height: 1080)
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
tenEighty



//Exercise 1
struct ThermoState {
    var temperature = 20.0 {
        didSet {
            if temperature > 25 {
                print ("Warning it is Hot!")
            } else if temperature < 10 {
                print("Warning it is Freezing")
            }
        }
    }
    
    var fahrenite : Double {
        get {
            (temperature * 9/5) + 32
        }
        
        set {
            temperature = (newValue + 32) * 9/5
        }
    }
}

//Exercise 2
class BankAccount {
    var balance = 0.0
    func deposit(amount : Double) {
        balance += amount
    }
}

let accountA = BankAccount()
var accountB = accountA

accountB.deposit(amount: 200)
print(accountA.balance)

//Exercise 3
struct ChessBoard {
    var board : [String:String] = [:]
    subscript (file : String, rank: Int)-> String {
        get {
            var loc = file + (String(rank))
            if let piece = board[loc] {
                return piece
            }
            return "Empty"
        }
        
        set {
            let loc = file + String(rank)
            board[loc] = newValue
        }
    }
    
}


//Exercise 4
struct Wallet {
    var cents = 0
    
    var dollars : Double {
        get {
            Double(cents)/100.0
        }
        set {
            cents = Int(newValue * 100)
        }
    }
}

var wallet = Wallet()
wallet.dollars = 5.50


//Exercise5
class Robot {
    var battery = 100
}
let robot1 = Robot()
let robot2 = robot1
let robot3 = Robot()

robot1===robot2 ? print("Same Robot") : print("Different Robot")
robot1===robot3 ? print("Same Robot") : print("Different Robot")
robot2.battery = 20
print(robot1.battery)


//Exercise 6
struct Planner {
    var tasks = Array(repeating: "", count: 7)
    subscript(dayIndex : Int) -> String{
        get {
            if (dayIndex < 7) && (dayIndex >= 0)  {
                return tasks[dayIndex]
            }
            return "Invalid Day"
        }
        set {
            if dayIndex < 7 && dayIndex >= 0 {
                tasks[dayIndex] = newValue
            } else {
                print("Can`t schedule for the day \(dayIndex)")
            }
            
        }
    }
}

//Inhertiance
class Character {
    var name : String
    var hp = 100

    init(name: String) {
        self.name = name
    }

    func attack() -> String{
        "Attacking with bare hands"
    }
}

class Wizard : Character {
    var mana = 50
    
    override func attack() -> String {
        mana -= 10
        return "Casting Fireball"
    }
}


//Intilizations
class SpaceShip {
    var name : String
    var shieldStrenght : Int
    
    init(name: String, shieldStrenght : Int) {
        self.name = name
        self.shieldStrenght = shieldStrenght
    }
    
    convenience init(name: String) {
        self.init(name: name, shieldStrenght: 50)
    }
}

class Fighter : SpaceShip {
    var weapon : String
    
    init(name: String, shieldStrenght: Int ,weapon: String) {
        self.weapon = weapon
        super.init(name: name, shieldStrenght: shieldStrenght)
    }
}


//Refernce Count (Memory Leaking)
class Boss {
    var name : String
    var employee : Worker?
    init(name : String) {
        self.name = name
    }
    deinit {
        print("\(self.name) fired \(self.employee?.name ?? "None")")
    }
}
class Worker {
    var name : String
    weak var boss : Boss?
    //var boss : Boss?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(self.name) resignes to \(self.boss?.name ?? "None")")
    }
}

var b1 : Boss? = Boss(name: "Tony")
var w1 : Worker? = Worker(name: "John")
b1?.employee = w1
w1?.boss = b1
print(b1?.employee?.name ?? "None")
print(w1?.boss?.name ?? "None")
b1 = nil
w1 = nil
print(b1 ?? "Not Exist")
