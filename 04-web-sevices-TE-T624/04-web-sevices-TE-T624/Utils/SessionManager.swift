//
//  TokenManager.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

final class SessionManager {
    
    static let shared = SessionManager()
    
    private init() {}
    
    var usrId: Int?
    var refreshToken: String?
    var accessToken: String?
    
}
