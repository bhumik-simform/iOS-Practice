//
//  OnboardingCoordinator.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 07/04/26.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if let welcomeVC = UIStoryboard(name: "OnboardingFlow", bundle: nil).instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC {
            welcomeVC.coordinator = self
            navigationController.pushViewController(welcomeVC, animated: false)
        }
    }
    
    func gotoProfileSetup() {
        if let profileVC = UIStoryboard(name: "OnboardingFlow", bundle: nil).instantiateViewController(withIdentifier: "ProfileSetupVC") as? ProfileSetupVC {
            navigationController.pushViewController(profileVC, animated: true)
        }
    }
    
}
