//
//  LoginPresenter.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

import Foundation

final class LoginPresenter {
    
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
    weak var view: LoginViewProtocol?
    
    
}


extension LoginPresenter: LoginPresenterProtocol {
    func loginButtonTapped(userName: String?, password: String?) {
        view?.showLoading()
        interactor?.login(userName: userName, password: password)
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    func loginSuccessed(for userId: Int) {
        DispatchQueue.main.async {
            self.view?.hideLoading()
            self.view?.showDefaultState()
            self.router?.navigateToTasks(for: userId)
        }
    }
    
    func loginFailed(_ message: String) {
        DispatchQueue.main.async { [self] in
            view?.hideLoading()
            view?.showError(message)
        }
    }
}
