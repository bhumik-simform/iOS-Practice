//
//  RefreshSessionResponce.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

struct RefreshTokenResponce: Decodable {
    let accessToken: String
    let refreshToken: String
}
