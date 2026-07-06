//
//  LoginRepository.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

final class TodosRepository {

    private var networkService = NetworkService2()

    func login(_ request: LoginRequestEntity) async throws -> LoginResponse {
        try await networkService.login(request)
    }

    func fetchUserTasks(for userId: Int) async throws -> [UserTask] {
        try await networkService.fetchTasks(for: userId)
    }
}
