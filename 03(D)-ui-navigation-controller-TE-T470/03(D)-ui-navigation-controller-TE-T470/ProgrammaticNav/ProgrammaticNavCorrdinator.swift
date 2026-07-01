//
//  ProgrammaticNavCorrdinator.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 07/04/26.
//

import UIKit

class ProgrammaticNavCorrdinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if let homeViewController = UIStoryboard(name: "ProgNav", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            navigationController.pushViewController(homeViewController, animated: false)
        }
    }
}
