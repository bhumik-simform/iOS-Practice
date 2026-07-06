//
//  LoginModuleBuilder.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

import UIKit

final class LoginModuleBuilder {

    static func build(routerDelegate: LoginRouterDelegate) -> UIViewController
    {

        guard
            let view = UIStoryboard(name: "Todos", bundle: nil)
                .instantiateViewController(
                    withIdentifier: "LoginViewController")
                as? LoginViewController
        else {
            return UIViewController()
        }

        let presenter = LoginPresenter()

        let interactor = LoginInteractor()

        let router = LoginRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.delegate = routerDelegate

        return view
    }

}
