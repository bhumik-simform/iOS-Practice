//
//  NetworkServicesCoordinator.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

import UIKit

final class TodosCoordinator: Coordinator {

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let initialVC = LoginModuleBuilder.build(routerDelegate: self)
        navigationController.pushViewController(initialVC, animated: true)
    }
}

extension TodosCoordinator: LoginRouterDelegate {
    
    func navigateToUserTasks(for userId: Int) {
        let destination = UserTaskBuilder.build(routerDelegate: self, userId: userId)
        navigationController.pushViewController(destination, animated: true)
    }
}

extension TodosCoordinator: UserTasksRouterDelegate {
    
}
