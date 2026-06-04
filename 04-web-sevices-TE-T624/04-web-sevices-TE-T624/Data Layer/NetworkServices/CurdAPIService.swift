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
}
