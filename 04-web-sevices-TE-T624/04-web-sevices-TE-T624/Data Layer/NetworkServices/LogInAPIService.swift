//
//  LogInAPIService.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

import Foundation

class LogInAPIService {
    
    func logIn(with logInRequest: LogInRequest) async throws -> LogInResponce? {
        
        guard let url = URL(string: "https://dummyjson.com/auth/login") else {
            
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print(try JSONEncoder().encode(logInRequest))
        
        urlRequest.httpBody = try JSONEncoder().encode(logInRequest)
        
        let (data,responce) = try await URLSession.shared.data(for: urlRequest)
        
        print(String(data: data, encoding: .utf8) ?? "")
        print(responce)
        
        guard let urlResponce = responce as? HTTPURLResponse,(200...299).contains(urlResponce.statusCode) else {
            return nil
        }
        
        print(try JSONDecoder().decode(LogInResponce.self, from: data))
        return try JSONDecoder().decode(LogInResponce.self, from: data)
        
    }
}
