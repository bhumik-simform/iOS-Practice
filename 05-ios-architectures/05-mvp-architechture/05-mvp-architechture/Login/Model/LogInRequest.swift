//
//  Untitled.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 26/06/26.
//

struct LogInRequest: Encodable {
    
    let userName:String
    let password: String
    
    private enum CodingKeys: String, CodingKey {
        case userName = "username"
        case password
    }
    
}
