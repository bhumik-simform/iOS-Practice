//
//  LoginResponse.swift
//  05-mvvm-architecture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

struct LoginResponse: Decodable {
    
    let userId: Int
    let firstName: String
    let accessToken: String
    let refreshToken: String
    
    private enum CodingKeys: String, CodingKey {
        case userId = "id"
        case firstName
        case accessToken
        case refreshToken
    }
}
