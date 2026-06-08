//
//  LogInRepository.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

class LogInRepository {
    
    private let apiService = LogInAPIService()
    
    func login(with logInRequest: LogInRequest) async throws -> LogInResponce? {
        
        return try await apiService.logIn(with: logInRequest)
    }
    
}
