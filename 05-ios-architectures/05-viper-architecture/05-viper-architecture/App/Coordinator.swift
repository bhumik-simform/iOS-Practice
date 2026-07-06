//
//  Coordinator.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 02/07/26.
//
import UIKit

protocol Coordinator: AnyObject {

    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }

    func start()
}
