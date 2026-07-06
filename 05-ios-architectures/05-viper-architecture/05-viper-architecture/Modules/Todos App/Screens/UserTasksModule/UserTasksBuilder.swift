//
//  UserTasksBuilder.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 06/07/26.
//

//
//  LoginModuleBuilder.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

import UIKit

final class UserTaskBuilder {

    static func build(routerDelegate: UserTasksRouterDelegate, userId: Int) -> UIViewController
    {

        guard
            let view = UIStoryboard(name: "Todos", bundle: nil)
                .instantiateViewController(
                    withIdentifier: "UserTasksViewController")
                as? UserTasksViewController
        else {
            return UIViewController()
        }
        
        view.userId = userId

        let presenter = UserTasksPresenter()

        let interactor = UserTasksInteractor()

        let router = UserTasksRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

//        router.delegate = routerDelegate

        return view
    }

}
