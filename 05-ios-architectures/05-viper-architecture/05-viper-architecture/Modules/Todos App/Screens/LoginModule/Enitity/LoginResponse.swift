//
//  LoginResponse.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 06/07/26.
//

struct LoginResponse: Decodable {
    let userId: Int
    
    private enum CodingKeys: String, CodingKey {
        case userId = "id"
    }
}
