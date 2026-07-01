//
//  LogInAPIService.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

import Foundation

class AuthAPIService {

    private let basePath = "https://dummyjson.com/auth/"

    func logIn(with request: LogInRequest) async throws -> LogInResponce {

        guard let url = URL(string: "\(basePath)/login") else {
            throw NetworkError.invalidURL
        }

        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = "POST"

        urlRequest.setValue(
            "application/json", forHTTPHeaderField: "Content-type")

        urlRequest.httpBody = try JSONEncoder().encode(request)

        let (data, responce) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = responce as? HTTPURLResponse else {
            throw NetworkError.invalidResponce
        }

        switch httpResponse.statusCode {
        case 200...299:
            break
        case 400:
            throw NetworkError.unAuthorised
        case 500...599:
            throw NetworkError.serverError
        default:
            throw NetworkError.unknown
        }

        do {
            return try JSONDecoder().decode(LogInResponce.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }

    }
    
    func getUserDetails(accessToken: String)async throws -> AuthedUser {
        guard let url = URL(string: "\(basePath)/me")
    }

}
