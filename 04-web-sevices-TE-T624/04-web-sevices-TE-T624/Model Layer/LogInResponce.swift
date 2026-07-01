//
//  LogInResponce.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

struct LogInResponce: Decodable {
    let id: Int
    let userName: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
    let accessToken: String
    let refreshToken: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case userName = "username"
        case email
        case firstName
        case lastName
        case gender
        case image
        case accessToken
        case refreshToken
    }
}
