//
//  NetworkService2.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

import Alamofire

protocol NetworkServiceProtocol{}

final class NetworkService2: NetworkServiceProtocol {
    
    func login(_ request: LoginRequestEntity) async throws -> LoginResponse {

            let url = "https://dummyjson.com/auth/login"

            return try await AF.request(
                url,
                method: .post,
                parameters: request,
                encoder: JSONParameterEncoder.default
            )
            .validate()
            .serializingDecodable(LoginResponse.self)
            .value
        }

    func fetchTasks(for userId: Int) async throws -> [UserTask] {
        
        let url = "https://dummyjson.com/todos"
        
        let request: [String: Int] = ["userId": userId]
        
        return try await AF.request(
            url,
            method: .get,
            parameters: request
        ).validate().serializingDecodable(Todos.self).value.todos

    }
}
