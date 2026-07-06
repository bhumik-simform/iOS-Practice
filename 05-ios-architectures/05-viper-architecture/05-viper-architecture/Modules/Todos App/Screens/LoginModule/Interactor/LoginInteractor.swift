//
//  LoginInteractor.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

final class LoginInteractor {
    
    let repository = TodosRepository()
    
    weak var presenter: LoginInteractorOutputProtocol?
    
}


extension LoginInteractor: LoginInteractorProtocol {
    
    func login(userName: String?, password: String?) {
        
        guard let userName, !userName.isEmpty, let password, !password.isEmpty else {
            presenter?.loginFailed("Please Enter UserName and Password")
            return
        }
        
        let request = LoginRequestEntity(userName: userName, password: password)
        
        Task {
            do {
                let loginResponse = try await repository.login(request)
                presenter?.loginSuccessed(for: loginResponse.userId)
            } catch {
                presenter?.loginFailed(error.localizedDescription)
            }
        }
        
    }
}
