//Exercise 1
enum WeatherCondtition {
    case sunny
    case cloudly
    case rainly
    case snowy
}

func weatherAdvice(for weather : WeatherCondtition) {
    switch weather {
    case .sunny: print("Apply Sunscream")
    case .cloudly: print("Just Go Out")
    case .rainly:print("Take Umbrella")
    case .snowy: print("Wear Coat")
    }
}


//Execirse 2
enum Diffculty : Int {
    case easy = 1, medium, hard
}

let diffculty = Diffculty(rawValue: 2)
print(Diffculty.hard.rawValue)

//Exercise 3
enum PaymentMethod {
    case cash
    case creditCard(cardProvider : String)
    case bankTransfer(transectionID : Int)
}

let creditcard1 = PaymentMethod.creditCard(cardProvider: "Visa")
switch creditcard1 {
    case .cash : print("It is cash no info related to it.")
    case .creditCard(let cardProvider): print("Car Provider name is: \(cardProvider)")
    case .bankTransfer(let transectionID): print("Transection ID is \(transectionID)")
}


enum Theme : CaseIterable {
    case ligth
    case dark
    case system
}

for currentTheme in Theme.allCases {
    print("Availble Theme : \(currentTheme)")
}
print(Theme.allCases.count)
//print(Theme.allCases)


enum FileSystemNode {
    case file(name : String)
    case folder(name : String, contents: [FileSystemNode])
}

let readmeFile = FileSystemNode.file(name: "My File.txt")
let folder1 = FileSystemNode.folder(name: "Project" ,
                                    contents: [FileSystemNode.file(name: "Readme.md")]
                            )

let folder2 = FileSystemNode.folder(name: "Image", contents: [] )


//OG Exercise
enum SecurityStatus {
    case armed
    case unaramed
}

enum SmartDevice {
    case light(level : Int)
    case thermostat(temp : Double)
    case security(status: SecurityStatus)
    case macro (name : String, commands: [SmartDevice])
    
    var description : String {
        switch self {
            case .light(let level) :
                "The Light Level is \(level)."
            case .thermostat(let temp) :
                "The Temperature of the device is: \(temp)"
            case .security(let status) :
                "The Security Status is: \(status.self)"
            case .macro(let name,let commands) :
            "Executing Macro \(name) with \(commands.count) commands."
        }
    }
    
    func Action() {
        print(self.description)
        switch self {
        case .macro(let name, let commands) :
            print("----Macro List Strated----")
            for command in commands {
                print(command.description)
            }
            print("----Print Macro List----")
        default:
            break
        }
    }
}

let kitchenLight = SmartDevice.light(level: 80)
let hallSecurity = SmartDevice.security(status: .armed)

let leaveHomeMacro = SmartDevice.macro(name: "Leave Home", commands: [
    .light(level: 0),
    .security(status: .armed),
    .thermostat(temp: 18.0)
])

leaveHomeMacro.description
leaveHomeMacro.Action()
print(kitchenLight.description)
print(hallSecurity.description)


