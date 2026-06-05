//
//  CurdAPIService.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 03/06/26.
//

import Foundation

final class CurdAPISevice {

    func fetchUsers(
        completion: @escaping (Result<[User], Error>) -> Void
    ) {

        guard
            let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, responce, error) in

            guard let jsonResponce = data, error == nil else {
                return
            }

            do {
                let users = try JSONDecoder().decode(
                    [User].self, from: jsonResponce)
                
                completion(.success(users))
                
            } catch let parsingerror {
                completion(.failure(parsingerror))
            }

        }.resume()

    }

    func createUser(requestModel: CreateUserModel) async throws -> User {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "POST"
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpBody = try JSONEncoder().encode(requestModel)
        
        let (data, _ ) = try await URLSession.shared.data(for: urlRequest)
        
        return try JSONDecoder().decode(User.self, from: data)
        
    }
    
    func updateUser(updatedUser: User) async throws -> User {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(updatedUser.id)") else {
            return User(id: -1, name: "", userName: "", email: "")
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "PUT"
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlRequest.httpBody = try JSONEncoder().encode(updatedUser)
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        print(try JSONDecoder().decode(User.self, from: data))
        
        return try JSONDecoder().decode(User.self, from: data)
        
    }
    
    func deleteUser(with userId: Int) async throws {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userId)") else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "DELETE"
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let (_, responce) = try await URLSession.shared.data(for: urlRequest)
        
        guard let responceCode = responce as? HTTPURLResponse else {
            return
        }
        
        print(responceCode.statusCode)
        
    }
}
