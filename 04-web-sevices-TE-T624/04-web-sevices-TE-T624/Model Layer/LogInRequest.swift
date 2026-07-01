//
//  LogInRequest.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

struct LogInRequest: Encodable {
    let userName: String
    let password: String
    
    private enum CodingKeys: String, CodingKey {
        case userName = "username"
        case password
    }
}
