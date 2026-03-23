var multipltyClosure = { (a : Int, b : Int) -> Int in
    return a * b
}

let numbers = [1, 5, 10, 2, 20]

print(numbers)
//Senario 1
let result1 = numbers.filter( { (number : Int) -> Bool in
    return number > 5
})
print(result1)

//Senario 2
let result2 = numbers.filter( { number  in
    return number > 5
})
print(result2)

//Senario 3
let result3 = numbers.filter({ number in number > 5 })
print(result3)

//Senario 4
let result4 = numbers.filter { $0  > 5 }
print(result4)

print(numbers)

func makeStepCounter () -> ()->Int {
    var totalStep = 0
    return  {
        totalStep += 1
        return totalStep
    }
}


//Modarate Exercise
var score = 100
let printScore = {
    print("The Score is \(score)")
}
score = 200
printScore()


//Exercise 2
class GymTainer {
    
    var savedPlan : (()->Void)? // Escapble Closure
    
    func warmUp (exercise : ()-> Void) {
        print("Wram Up started")
        exercise()
        print("Wram Up completed")
    }
    
    func savedWeekPlan(plan : @escaping ()-> Void) {
        print("I am saving this plan  your weekend")
        var savedPlan = plan
        print("Plan is saved. See you later")
    }
    
}
let arnold = GymTainer()
arnold.warmUp {
    print("Do Jumps")
}
arnold.savedWeekPlan {
    print("Do pushups")
}
arnold.savedPlan?()


//Exercise 3
class Shop {
    var deliveryCallback : ((_ isBurnt : Bool, _ message : String) -> Void)?
    func orderPizza (menuItem : String,
                     onCompletion : @escaping (Bool,String) -> Void
    ){
        print("Order Recive of \(menuItem), cokking Started")
        deliveryCallback = onCompletion
    }
    
    func cookingCompleted (isSucess : Bool) {
        print("Cooking Finished Tell Coustmer")
        
        if isSucess {
            deliveryCallback?(true, "Here is Deliious Pizza")
        } else {
            deliveryCallback?(false, "orry, We burned it.")
        }
    }
}


let lapinoz = Shop()
lapinoz.orderPizza(menuItem: "Thin Crust") { sucess,message in
    if sucess {
        print("Me: Yay ! \(message)")
    } else {
        print("Me: Oh no ! \(message)")
    }
}
print("Waiting for pizza")
lapinoz.cookingCompleted(isSucess: true)

