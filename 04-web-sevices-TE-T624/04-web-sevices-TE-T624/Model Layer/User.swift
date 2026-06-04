//
//  User.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 03/06/26.
//

struct User: Codable {
    let id: Int
    var name: String
    var userName: String
    var email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case userName = "username"
        case email
    }
}
