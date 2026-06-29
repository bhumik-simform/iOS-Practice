//
//  AppRepository.swift
//  05-mvvm-architecture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

final class AppRepository {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    
    func login(_ request: LoginRequest) async throws -> LoginResponse {
        try await networkService.login(request)
    }
    
    func fetchUserTasks(for userId: Int) async throws -> [UserTask] {
        try await networkService.fetchTasks(for: userId)
    }
    
}
