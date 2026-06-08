//
//  LogInResponce.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

struct LogInResponce: Decodable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
    let accessToken: String
    let refreshToken: String
}
