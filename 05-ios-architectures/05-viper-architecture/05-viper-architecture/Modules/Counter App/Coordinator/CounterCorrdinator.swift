//
//  CounterCorrdinator.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 02/07/26.
//

import UIKit

final class CounterCoordinator: Coordinator {

    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let initialVC = CounterModuleBuilder.build(routerDelegate: self)
        navigationController.pushViewController(initialVC, animated: true)
    }
}

extension CounterCoordinator: CounterRouterDelegate {
    func routeToColorPicker() {
        let destinationVC = ColorPickerModuleBuilder.build(routerDelegate: self)
        navigationController.pushViewController(destinationVC, animated: true)
    }
}

extension CounterCoordinator: ColorPickerRouterDelegate {
    func routeBackToCounter() {
        navigationController.popViewController(animated: true)
    }
}
