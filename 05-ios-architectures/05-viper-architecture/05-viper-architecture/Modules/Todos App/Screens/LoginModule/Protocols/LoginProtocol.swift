//
//  LoginProtocol.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

protocol LoginPresenterProtocol {
    func loginButtonTapped(userName: String?, password: String?)
}

protocol LoginInteractorProtocol {
    func login(userName: String?, password: String?)
}

protocol LoginInteractorOutputProtocol: AnyObject {
    func loginSuccessed(for userId: Int)
    func loginFailed(_ message: String)
}

protocol LoginViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(_ message: String)
    func showDefaultState()
}

protocol LoginRouterProtocol {
    func navigateToTasks(for userId: Int)
}

protocol LoginRouterDelegate: AnyObject {
    func navigateToUserTasks(for userId: Int)
}
