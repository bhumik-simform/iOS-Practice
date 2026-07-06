//
//  LoginRequest.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

struct LoginRequestEntity: Encodable {
    let userName: String
    let password: String
    
    private enum CodingKeys: String, CodingKey {
        case userName = "username"
        case password
    }
}
