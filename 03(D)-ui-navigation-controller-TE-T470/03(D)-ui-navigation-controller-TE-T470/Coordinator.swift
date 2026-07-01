//
//  Coordinator.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 07/04/26.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }

    func start()
}
