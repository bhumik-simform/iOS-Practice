//
//  LogInRepository.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

class AuthRepository {

    private let apiService = AuthAPIService()

    func login(with request: LogInRequest) async throws -> AuthedUser {

        let responce = try await apiService.logIn(with: request)

        SessionManager.shared.usrId = responce.id
        SessionManager.shared.accessToken = responce.accessToken
        SessionManager.shared.refreshToken = responce.refreshToken

        return AuthedUser(
            id: responce.id, userName: responce.userName, email: responce.email,
            firstName: responce.firstName, lastName: responce.lastName,
            gender: responce.gender, image: responce.image)

    }

}
