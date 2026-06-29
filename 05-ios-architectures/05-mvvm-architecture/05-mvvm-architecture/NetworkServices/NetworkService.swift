//
//  NetworkService.swift
//  05-mvvm-architecture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

import Alamofire

final class NetworkService {

    func login(_ request: LoginRequest) async throws -> LoginResponse {

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
