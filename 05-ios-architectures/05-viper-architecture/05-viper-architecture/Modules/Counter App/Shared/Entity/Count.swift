//
//  Count.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 02/07/26.
//

struct Count {
    
    static var shared = Count()
    
    var value: Int
    var colour: CountColor
    
    enum CountColor {
        case red
        case black
        case blue
        case green
    }
    
    private init(value: Int = 0, colour: CountColor = .black) {
        self.value = value
        self.colour = colour
    }
}
