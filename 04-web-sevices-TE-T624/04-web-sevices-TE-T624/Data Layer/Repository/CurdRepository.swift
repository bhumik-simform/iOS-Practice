//
//  UserRepository.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 03/06/26.
//

final class CurdRepository {
    
    private let apiService = CurdAPISevice()
    
    func getUsers(
        completion: @escaping (Result<[User],Error>) -> Void
    ) {
        apiService.fetchUsers(completion: completion)
    }

    func createUser(requestModel request: CreateUserModel) async throws -> User {
        return try await apiService.createUser(requestModel: request)
    }
    
    func updateUser(newUser updatedUser: User) async throws -> User {
     
        return try await apiService.updateUser(updatedUser: updatedUser)
        
    }
}
