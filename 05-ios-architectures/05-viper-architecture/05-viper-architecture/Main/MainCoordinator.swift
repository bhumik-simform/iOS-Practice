//r
//  MainCoordinator.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 02/07/26.
//

import UIKit

final class MainCoordinator: Coordinator {

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        guard
            let mainViewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "MainViewController")
                as? MainViewController
        else {
            return
        }

        mainViewController.coordinator = self

        navigationController.pushViewController(
            mainViewController, animated: false)
    }

    func goToCounterApp() {

        let counterCoordinator = CounterCoordinator(navigationController)
        childCoordinators.append(counterCoordinator)
        counterCoordinator.start()
    }

    func goToTodosApp() {
        
        let todosCoordinator = TodosCoordinator(navigationController)
        childCoordinators.append(todosCoordinator)
        
        todosCoordinator.start()
    }
}
