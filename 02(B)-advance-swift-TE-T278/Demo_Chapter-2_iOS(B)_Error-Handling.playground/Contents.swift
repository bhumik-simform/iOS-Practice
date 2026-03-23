//Representing and Throwing Errors
enum BudgetError : Error {
    case negativeAmount
    case insufficientBalance (amountNeeded : Double)
    case categoryNotFound
}

//let transectionAmount = -50
//guard transectionAmount >= 0 else {
//    throw BudgetError.negativeAmount
//}

//Propagating Errors Using Throwing Functions
func addTransaction(amount : Double, currentBalance : Double) throws -> Double {
    guard amount <= currentBalance else {
        let amountneeded = amount - currentBalance
        throw BudgetError.insufficientBalance(amountNeeded: amountneeded)
    }
    return currentBalance-amount
}

//Handling Errors Using Do-Catch
let transactionAmount = 20.0
let balance = 100.0
do {
    let newBalance = try addTransaction(amount: transactionAmount, currentBalance: balance)
    print("Transaction Sucessful current Balance is: \(newBalance)")
} catch BudgetError.insufficientBalance(let amountNeeded) {
    print("Insufficiemt Balance : Need \(amountNeeded) for transection")
} catch BudgetError.negativeAmount {
    print("Please Enter Positive Amount")
} catch {
    print("Unexpected Error Ouccred : \(error)")
}

//Converting Errors to Optional Values (try?)
func loadBudget() throws -> Double {
    throw BudgetError.categoryNotFound
}

let budgetSaved = try? loadBudget()
if let budget = budgetSaved {
    print("Budget Loaded : \(budget)")
} else {
    print("Using Default Budget")
}

//Disabling Error Propagation (try!)
func loadBundleFile () throws -> String {
    return "{ 'food' : [0] }"
}

let config = try! loadBundleFile()
print("Config Loaded : \(config)")

//Specifying the Error Type (Typed Throws)
enum ValidationError : Error {
    case emptyInput
}
func validateEntry (text : String) throws(ValidationError) {
    guard !text.isEmpty else  {
        throw .emptyInput
    }
    print("Valid Entry")
}

//Specifying Cleanup Actions defer block
func openDatabaseTransaction () throws {
    
    print("Database Opened")
    defer {
        print("Database Closed")
    }
    print("Saving Data")
    throw BudgetError.categoryNotFound
}

try? openDatabaseTransaction()


//Exercise 1
enum ATMError : Error {
    case insufficentFunds (needed : Double)
    case dailyLimitExceeded (limit : Double)
    case cardLocked
}

class BankAccount {
    var balance : Double
    var dailytWithdrawn : Double = 0
    var dailyLimit : Double
    var isLocked : Bool = false
    
    init(balance: Double , dailyLimit: Double) {
        self.balance = balance
        self.dailyLimit = dailyLimit
        
    }
    
    //Exercise 2
    func withDrawn(amount : Double) throws {
        guard !self.isLocked else {
            throw ATMError.cardLocked
        }
    
        guard self.balance > amount else { throw ATMError.insufficentFunds(needed: amount-self.balance) }
        
        guard (self.dailytWithdrawn+amount <= self.dailyLimit) else {
            throw ATMError.dailyLimitExceeded(limit: self.dailyLimit)
        }
        
        self.balance -= amount
        self.dailytWithdrawn += amount
        print("Withdrawn Successful")
    }
    
    func simulateWithdrawal(amount: Double) throws {
        if amount > self.balance {
            throw ATMError.insufficentFunds(needed: amount-self.balance)
        }
        return
    }
}

func startATMSession(account : BankAccount, amount : Double) {
    print("1.Inserting Card")
    defer {
        print("5.Ejectng Card")
    }
    
    print("2. Processing Transaction")
    do {
        try account.withDrawn(amount: amount)
    } catch ATMError.cardLocked {
            print("Error: Card is Locked! Call Back")
    } catch ATMError.insufficentFunds(let needed) {
            print("Error: You are short by : \(needed)$")
    } catch ATMError.dailyLimitExceeded(let limit) {
        print("Error: You exceeded your daily limit which is : \(limit)$")
    } catch {
        print("Error: Unexpected Error Ouccred \(error)")
    }
    
    print("4. Session Completed")
}

func canAfford(account : BankAccount,iteamPrice : Double) -> Bool {
    (try? account.simulateWithdrawal(amount: iteamPrice)) != nil
}


