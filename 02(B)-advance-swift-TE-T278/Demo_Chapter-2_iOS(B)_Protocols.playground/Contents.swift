print("------------- Exercise-1 -------------")
protocol TransactionItem {
    var amount : Double {get}
    var note : String {get set}
    func printDetails()
    mutating func clearNote()
}

struct GroceryExpense : TransactionItem {
    var amount: Double
    var note : String
    
    mutating func clearNote() {
        self.note = ""
    }
}

print("------------- Exercise-2 -------------")
extension TransactionItem {
    func printDetails() {
        print("Transection for $\(self.amount) : \(self.note)")
    }
}

print("------------- Exercise-3 -------------")
struct FreelanceIncome : TransactionItem {
    var amount: Double
    var note : String
    
    mutating func clearNote() {
        self.note = ""
    }
}
let groceryRun = GroceryExpense(amount: 450.0, note: "Vegetables and Milk")
let appDesignProject = FreelanceIncome(amount: 5000.0, note: "UI Design for Client")
let movieNight = GroceryExpense(amount: 300.0, note: "Tickets and Popcorn")


let recentActivity: [TransactionItem] = [groceryRun, appDesignProject, movieNight]
for activity in recentActivity {
    activity.printDetails()
}

print("------------- Exercise-4 -------------")
protocol Dateable {
    var date : String {get}
}


func generateReport(item: TransactionItem & Dateable) {
    print("Date : \(item.date)",terminator: "|")
    item.printDetails()
}

struct DatedExpense : TransactionItem, Dateable {
    var amount: Double
    var note: String
    var date: String
    
    mutating func clearNote() {
        self.note = ""
    }
}

let yesterdayLunch = DatedExpense(amount: 120.0, note: "Thali", date: "18-Feb-2026")
generateReport(item: yesterdayLunch)


print("------------- Exercise-5 -------------")
protocol AddExpenseDelegate : AnyObject {
    func didSaveExpense(amount: Double)
}

class AddExpenseViewController {
    weak var delegate : AddExpenseDelegate?
    func saveButtonTapped() {
        let newAmount = 250.0
        print("AddExpenseVC: Saving ₹\(newAmount)...")
        delegate?.didSaveExpense(amount: newAmount)
    }
}

class HomeViewController : AddExpenseDelegate {
    var totalBalance = 1000.00
    func didSaveExpense(amount: Double) {
        totalBalance += amount
        print("HomeVC: Received new expense! Total balance is now ₹\(totalBalance)")
    }
}


print("------------- Real Development Problems -------------")
print("      ------------- Exercise-6 -------------")

enum TransactionError : Error {
    case insufficientBalance
    case negativeAmount
}

protocol Payable {
    var amount : Double {get}
    func deduct(from balance: inout Double) throws
}

protocol PaymentDelegate : AnyObject {
    func didFinishPayment(remainingBalance: Double)
    func paymentDidFail(error : TransactionError)
}

struct Subscription : Payable {
    var amount: Double
    func deduct(from balance: inout Double) throws {
        if amount < 0 {
            throw TransactionError.negativeAmount
        } else if balance < amount {
            throw TransactionError.insufficientBalance
        }
        balance -= amount
    }
}

class PaymentGateAway {
    var balance = 1000.0
    weak var delegate : PaymentDelegate?
    
    func process(item : Payable) {
        do {
            try item.deduct(from: &balance)
            delegate?.didFinishPayment(remainingBalance: balance)
        } catch TransactionError.insufficientBalance {
            delegate?.paymentDidFail(error: .insufficientBalance)
        } catch TransactionError.negativeAmount {
            delegate?.paymentDidFail(error: .negativeAmount)
        } catch {
            print("Unexpected Error Ocurred Try Again: \(error)")
        }
    }
}

class NewHomeViewController : PaymentDelegate {
    func didFinishPayment(remainingBalance: Double) {
        print("Transection Sucessful Remaining Balance is: \(remainingBalance)")
    }
    func paymentDidFail(error: TransactionError) {
        switch error {
            case .insufficientBalance: print("You have insufficientbalance.")
            case .negativeAmount:
                print("Please enter valid amount current amount is Negative")
        }
        
    }
}

let raj = PaymentGateAway()
let tempDelegate = NewHomeViewController()
raj.delegate = tempDelegate
raj.process(item: Subscription(amount: 200.0))

print("      ------------- Exercise-7 -------------")
protocol Tracakable {
    var name : String { get }
}

protocol Tunable : Tracakable {
    mutating func decreaseDownforce()
    func runSimulation(completion: (String)->Void )
}

extension Tunable {
    func runSimulation(completion: (String) -> Void)  {
        completion("\(name) finished the simulated lap!")
    }
}

struct FormulaCar : Tunable {
    var name : String
    func decreaseDownforce() {
        print("Aero adjusted for top speed.")
    }
}

struct SaftyCar : Tracakable {
    var name: String
}

let cars : [Tracakable] = [FormulaCar(name: "Farrai"),SaftyCar(name: "A")]
for car in cars {
    if var currentCar = car as? FormulaCar {
        currentCar.decreaseDownforce()
        currentCar.runSimulation { print($0) }
    }
}
