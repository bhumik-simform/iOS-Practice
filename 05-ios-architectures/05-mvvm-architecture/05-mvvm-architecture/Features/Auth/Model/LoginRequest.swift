//
//  LoginRequest.swift
//  05-mvvm-architecture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

struct LoginRequest: Encodable {
    let userName: String
    let password: String
    
    private enum CodingKeys: String, CodingKey {
        case userName = "username"
        case password
    }
}
