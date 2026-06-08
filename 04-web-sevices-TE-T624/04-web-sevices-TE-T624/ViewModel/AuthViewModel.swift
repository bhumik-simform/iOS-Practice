//
//  LoginViewModel.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

class AuthViewModel {

    private let repository = AuthRepository()

    func login(userName: String, password: String) {

        let request = LogInRequest(userName: userName, password: password)

        Task {

            do {

                let authedUser = try await repository.login(with: request)

            } catch let error {
                print(error)
            }

        }
        
    }
}
