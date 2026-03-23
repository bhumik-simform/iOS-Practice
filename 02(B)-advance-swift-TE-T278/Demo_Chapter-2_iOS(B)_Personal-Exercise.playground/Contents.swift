print("------------- Exercise-1 -------------")
// Exercise 1
enum Face {
    case beggar (location : String)
    case noble (house : String, gold : Int)
    case assasin (target : String, weapon : String)
    
    func revealIdentity() {
        switch self {
            case .noble(let house ,let gold) :
                print("Disguised as lord of House \(house) with \(gold) gold coins.")
            case .assasin(let target, let  weapon) :
                print("Disguised as assasin whose target is \(target) and preferred weapon is \(weapon).")
            case .beggar(let location) :
                print("Disguised as begger at \(location)")
        }
    }
}

let araya = Face.noble(house: "Lannister", gold: 500)
araya.revealIdentity()


// Exercise 2
print("------------- Exercise-2 -------------")
enum SoldierType {
    case archer
    case infantry
    case cavalry
}

struct Soldier {
    var name : String
    var type : SoldierType
    var stamina : Int
    var attackPower : Int
}

let jhonArmy : [Soldier] = [
        Soldier(name: "Ghost's Guard", type: .infantry, stamina: 85, attackPower: 12),
        Soldier(name: "Night's Watch Bowman", type: .archer, stamina: 40, attackPower: 15),
        Soldier(name: "Stark Vanguard", type: .infantry, stamina: 90, attackPower: 14), // High Stamina
        Soldier(name: "Free Folk Raider", type: .infantry, stamina: 60, attackPower: 10),
        Soldier(name: "Vale Knight", type: .cavalry, stamina: 70, attackPower: 25),
        Soldier(name: "Bear Island Brute", type: .infantry, stamina: 95, attackPower: 18), // Highest Stamina
        Soldier(name: "Mormont Shield", type: .infantry, stamina: 50, attackPower: 9),
        Soldier(name: "Winterfell Archer", type: .archer, stamina: 45, attackPower: 13),
        Soldier(name: "Dothraki Screamer", type: .cavalry, stamina: 80, attackPower: 22),
        Soldier(name: "Karstark Traitor", type: .infantry, stamina: 20, attackPower: 8) // Low Stamina
]


typealias BattleStrategy = ([Soldier]) -> [Soldier]
let infantaryFrenzy : BattleStrategy = { army in
    
    army
        .filter { $0.type == SoldierType.infantry }   // func onlyInfantry (soldier : Soldier) -> Bool {
                                                     //     return soldier.type == SoldierType.infantry
                                                    //   }
        
        .sorted { $0.stamina > $1.stamina }        //    func withHighStamina (soldier1 : Soldier, soldier2 : Soldier) -> Bool {
                                                  //        return soldier1.stamina > soldier2.stamina
                                                 //  }
        
        .map { solider in                      //    func doubleAttackPower (soldier : Soldier) -> Soldier {
            var tempSolider = solider         //        tempSolider = soldier
            tempSolider.attackPower *= 2     //         return solider
            return tempSolider              //       }
        }
//
//    return army
//        .filter { onlyInfantry(soldier: $0) }
//        .sorted { withHighStamina (soldier1:$0, soldier2:$1) }
//        .map { doubleAttackPower(soldier: $0) }
    
}

func execute(strategy: BattleStrategy, on army: [Soldier]) {
    let resultArmy =  strategy(army)
    for singleSoldier in resultArmy {
        print("[name : \(singleSoldier.name) , type : \(singleSoldier.type) , stamina : \(singleSoldier.stamina) , attackpower : \(singleSoldier.attackPower)]")
    }
}
execute(strategy: infantaryFrenzy, on: jhonArmy)

print("------------- Exercise-3 -------------")
// Exercise 3
struct Loan {
    var amount = 0

}
class Vault {
    var amount = 1_000_000
}

var loanA = Loan(amount: 500)
let loanB = loanA
loanA.amount = 1000

var vaultA = Vault()
let vaultB = vaultA
vaultA.amount = 2000
print("Loan A amount: \(loanA.amount)")
print("Loan B amount: \(loanB.amount)")
print("Vault A amount: \(vaultA.amount)")
print("Vault B amount: \(vaultB.amount)")

print("------------- Exercise-4 -------------")
//Exercise 4
class Dragon {
    func sōvēs() {
            print("Dragon is flying")
    }
    func dracarys () {
        print("Breathing fire")
    }
}

class IceDragon : Dragon {
    override func dracarys() {
        print("Breathing Ice Shards")
    }
}


let dragons : [Dragon] = [Dragon(),IceDragon()]
for beast in dragons {
    beast.dracarys()
}

print("------------- Exercise-5 -------------")
//Exercise 5
class Crow {
    let name : String
    var wolf : Wolf? // Strong Reference to Wolf
    init(name : String) {
        self.name = name
        print("\(name) : Watch Begins")
        print("Night gathers, and now my watch begins.")
    }
    
    deinit {
         print("\(name): Watch ended")
    }
}

class Wolf {
    let name : String
    // var owner : Crow? // Strong Reference to Crow
    weak var owner : Crow?
    init (name : String) {
        self.name = name
    }
    deinit {
        print("\(name): went into wild.")
    }
}

var sam : Crow? = Crow(name : "Sam")
var ghost : Wolf? = Wolf(name : "Ghost")
sam?.wolf = ghost
ghost?.owner = sam

sam = nil
ghost=nil

print("------------- Exercise-6 -------------")
class SlapBet {
    init(havingSlap : Int){
        slapsRemaining = havingSlap
    }
    var slapsRemaining : Int = 0 {
        didSet {
            if slapsRemaining < 0 {
                print("Stop! You cannot have negative slaps. Resetting to 0.Stop Marshall!") }
            else { print("Whoa! That's one down. \(slapsRemaining) slaps remaining.") }
        }
    }
    
    func slapHim(slap : Int) {
        slapsRemaining -= slap
    }
}

let marshall = SlapBet(havingSlap: 5)
marshall.slapHim(slap: 2)
marshall.slapHim(slap: 10)

print("------------- Exercise-7 -------------")
enum FaceError : Error {
    case notFound
    case unAuthorised
}

func requestFace(name : String) -> Result<String, FaceError> {
    if name == "Arya" {
            return .failure(.unAuthorised) // Rejection!
        } else if name == "Jaqen" {
            return .success("The Face of Jaqen H'ghar") // Success!
        } else {
            return .failure(.notFound) // Missing!
        }
}

let outcome = requestFace(name: "Arya")

switch outcome {
case .success(let faceName):
    print("You received: \(faceName)")
    
case .failure(let error):
    // You can even switch on the specific error inside!
    switch error {
    case .unAuthorised:
        print("A girl is not ready.")
    case .notFound:
        print("The Hall of Faces does not have this.")
    }
}


print("------------- Exercise-8 -------------")

struct BassPlayer {
    var name : String
    init(is name: String) {
        self.name = name
    }
}

struct Band {
    var sheIsBassPlayer : BassPlayer?
    init(has bassPlayer: BassPlayer?) {
        sheIsBassPlayer = bassPlayer
    }
}

struct Roommate{
    var isInBand : Band?
    init(in isInBand: Band?) {
        self.isInBand = isInBand
    }
}

struct Girl {
    var hasRoommate : Roommate?
    init(has roommate: Roommate?) {
        hasRoommate = roommate
    }
}


let bassPlayer = BassPlayer(is: "Tracy")
let band = Band(has: bassPlayer)
let rommate = Roommate(in: band)
let girl = Girl(has: rommate)

func isSheOne(girl : Girl) {
    if let name = girl.hasRoommate?.isInBand?.sheIsBassPlayer?.name  {
        print("The one is: \(name)")
    } else {
        print("Keep looking, Ted.")
    }
}

isSheOne(girl: girl)


print("------------- Exercise-9 -------------")
protocol Play {
    func perform()
}
struct Sansa : Play {
    func perform() {
        print("Barny claims to be Astronaut.")
    }
}
struct SqubaDiver : Play {
    func perform() {
        print("Barny resses in a scuba suit!")
    }
}

class PlayBook {
    var listOfPlay : [Play]
    init(plays: [Play] = [] ) {
        listOfPlay = plays
    }
    
}

let list  = PlayBook(plays: [ Sansa() , SqubaDiver() ] )
for play in list.listOfPlay {
    play.perform()
}
print("------------- Exercise-10 -------------")
protocol HandDelegate: AnyObject {
    func makeDecision(on: String)
}
class King {
    let name : String
    weak var hand : HandDelegate?
    
    init(name: String, hand: HandDelegate? = nil) {
        self.name = name
        self.hand = hand
    }
    func order(on order: String) {
        print("\(self.name) : \(order)")
        hand?.makeDecision(on: order)
    }
    
}

class HandOfTheKing : HandDelegate {
    let name : String
    func makeDecision(on: String) {
        print("\(self.name): We will not kill child.")
    }
    init(name : String) {
        self.name = name
    }
}
let ned = HandOfTheKing(name: "Ned")
let robert = King(name: "Robert", hand: ned)
robert.order(on: "Kill Daenerys Targaryen")

print("------------- Exercise-11 -------------")
/*Exercise 1: F1 Telemetry Analysis
 The Scenario: You are writing the strategy software for a Monoposto F1 car. You receive a massive stream of mixed sensor data, and you need to isolate specific metrics on the fly.

 The Blueprint:

 Create a reference-based blueprint for generic SensorData.

 Create two specialized child blueprints: TireWear and EngineTemp.

 Create an ordered grouping (a sequence) holding a mix of both types.

 Write a nameless, self-contained block of code (assign it to a variable) that takes this sequence as input.

 Inside that block, use a tool to check the true underlying identity of each item. Keep only the TireWear items and return them as a new sequence.*/
class SenorData {
    
}
class TireWear : SenorData {
    let wearPercentage : Int
    init(wearPercentage: Int) {
        self.wearPercentage = wearPercentage
    }
}

class EngineTemp : SenorData {
    let temperature : Int
    init(temperature: Int) {
        self.temperature = temperature
    }
}

let sensorDataList : [SenorData] = [ TireWear(wearPercentage: 45) , EngineTemp(temperature: 115) , EngineTemp(temperature: 120) , TireWear(wearPercentage: 80) ]
let tireSenorData : [TireWear] = sensorDataList.compactMap { $0 as? TireWear }
tireSenorData.map { print("Tire wear percentage is: \($0.wearPercentage)") }



print("------------- Exercise-12 -------------")
protocol PaymentDelegate : AnyObject {
    func didSaveTransaction(amount: Int)
}
class AddTransactionScreen {
    weak var delegate : PaymentDelegate?
    func save() {
        delegate?.didSaveTransaction(amount: 50)
    }
    deinit {
        print("AddTransactionScreen memory freed. No leaks!")
    }
}
class DashBoard : PaymentDelegate {
    func didSaveTransaction(amount: Int) {
        print("Dashboard updated with new expense: ₹\(amount)")
    }
}

let homeDashboard = DashBoard()
var entryScreen: AddTransactionScreen? = AddTransactionScreen()
entryScreen?.delegate = homeDashboard
entryScreen?.save()
entryScreen = nil

print("------------- Exercise-13 -------------")
class RidingGear {
    var brandName : String
    init(brand name: String) {
        self.brandName = name
    }
    func putOn() {
        print("Wearing gear")
    }
}

class FilpUpHelmet : RidingGear {
    var hasDualVisor : Bool
    init(brand name : String, hasDualVisor: Bool = false) {
        self.hasDualVisor = hasDualVisor
        super.init(brand: name)
    }
    override func putOn() {
        self.hasDualVisor ? print("Flipping Down Dual Visor") : print("Flipping Down Visor")
    }
    deinit {
        print("Helmet is retired")
    }
}

var helmet : FilpUpHelmet? = FilpUpHelmet(brand: "Honda", hasDualVisor: true)
print("Helmet is from brand: \(helmet?.brandName ?? "") " )
helmet?.putOn()
helmet = nil

print("------------- Exercise-14 -------------")
struct Player {
    let name : String
    let baseValue : Double
    var healthGood : Bool = true
    var marketValue : Double {
        return baseValue * 1.5
    }
}

enum TransferIssue : Error {
    case insufficientFunds
    case failedMedical
}

func transfer(player : Player, in club: String, with budget: Double) throws {
    if player.marketValue > budget { throw TransferIssue.insufficientFunds }
    if !player.healthGood { throw TransferIssue.failedMedical }
    print("\(club) bought \(player.name) in market value of \(player.marketValue) million")
}


extension Player {
    func celebration() {
        print("Siuuuuu!")
    }
}

let cristiano = Player(name: "Cristiano Ronaldo", baseValue: 50)
do {
    try transfer(player: cristiano, in: "Manchester United", with: 100)
    cristiano.celebration()
} catch TransferIssue.insufficientFunds {
    print("Club budget is insufficient for player.")
} catch TransferIssue.failedMedical {
    print("Player is not Medically Fit.")
} catch {
    print("There is an error in transfer which is: \(error)")
}

print("------------- Exercise-15 -------------")
struct RecipeBox {
    
    enum SpiceLevel {
        case mild
        case medium
        case hot
    }
    
    var ingredients : [String : String] = [:]
    var spiceLevel : SpiceLevel = .medium
    subscript (ingredient : String) -> String {
        get {
            if let portion = ingredients[ingredient] {
                return portion
            }
            return "Didn`t find know how much \(ingredient) needs to add."
        } set {
            ingredients[ingredient] = newValue
        }
    }
    func findSpiceLevel() {
        switch self.spiceLevel {
            case .hot: print("The Dish will be spicy.")
            case .medium: print("The Dish will be medium spicy.")
            case .mild: print("The Dish will be mild spicy.")
        }
    }
}

var recipe = RecipeBox()
recipe.spiceLevel
print(recipe["Trufulle Oil"])
recipe["Trufulle Oil"] = "few drops"
print(recipe["Trufulle Oil"])
recipe.findSpiceLevel()
