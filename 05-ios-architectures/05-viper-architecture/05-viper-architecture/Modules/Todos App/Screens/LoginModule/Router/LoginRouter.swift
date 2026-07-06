//
//  LoginRouter.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

final class LoginRouter: LoginRouterProtocol {
    
    weak var delegate: LoginRouterDelegate?
    
    func navigateToTasks(for userId: Int) {
        delegate?.navigateToUserTasks(for: userId)
    }
}
