//Execrsie 1
func greeting(name : String) -> String {
    "Welcome, \(name)"
}
//Execrsie 2
func calArea(length : Double , width : Double) -> Double {
    length*width
}
//Execrise 3
func logMessage(message : String) {
    print("[LOG] : \(message)")
}

//Execrise 4
func getBounds(inputArr : [Int]) -> (min : Int,max : Int) {
    var tempMin = Int.max
    var tempMax = Int.min
    
    for number in inputArr {
        if number > tempMax {
            tempMax = number
        }
        if number < tempMin {
            tempMin = number
        }
    }
    
    return (min : tempMin , max : tempMax)
}

print(getBounds(inputArr: [4,1,9,3]).min)

//Exercise 5
func getBoundsOp(inputArr : [Int]) -> (min : Int,max : Int)? {
    if inputArr.isEmpty { return nil }
    var tempMin = Int.max
    var tempMax = Int.min
    
    for number in inputArr {
        if number > tempMax {
            tempMax = number
        }
        if number < tempMin {
            tempMin = number
        }
    }
    
    return (min : tempMin , max : tempMax)
}

print(getBounds(inputArr: []))

//Execise 6
func move(by distance: Int) {
    print("moved \(distance)KM")
}
move(by: 50)

//Exercise 7
func multiply(_ a : Int, _ b : Int) -> Int {
    a*b
}
multiply(5,8)

//Exercise 8
func orderCoffee(type : String , sugarCubes : Int = 0) {
    sugarCubes != 0 ? print("\(type) with \(sugarCubes) sugarCubes.") : print("\(type) with no sugar.")
}
orderCoffee(type: "Latte", sugarCubes: 2)
orderCoffee(type: "Espresso")

//Execrise 9
func calAverage(_ numbers : Double...) -> Double {
    var total = 0.0
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}

//Execrise 10
func swapNumbers (_ a : inout Int, _ b : inout Int) {
    a = a ^ b
    b = a ^ b
    a = a ^ b
}
//swapNumbers(2,3) shows compile time Error
var x = 1
var y = 3 // if it is define by let(a.k.a Constant) it will show compile time Error
swapNumbers(&x , &y)

//Execrise --
func addNumber (_ a : Int, _ b : Int) -> Int {
    a+b
}
func multiplyNumber (_ a : Int, _ b : Int) -> Int {
    a*b
}
func subtractNumber (_ a : Int, _ b : Int) -> Int {
    a - b
}


//Execrise 11
var mathOpration = addNumber

// Execrise 12
func printResult(_ funcMath : (Int,Int) -> Int, _ a : Int, _ b : Int) -> Int {
    funcMath(a,b)
}
print(printResult(addNumber, 5, 3))

//Execrise 13
func chooseMathFunction (goPositive : Bool) -> (Int,Int) -> Int {
    let value = goPositive ? addNumber : subtractNumber
    return value
}


//Execrise 14
func countDown (_ n :Int) {
    func printNumber(_ n : Int) {
        if n<0 {return}
        print(n)
        printNumber(n-1)
    }
}
