//
//  FourthViewController.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 06/04/26.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToOrangeVCClicked(_ sender: UIButton) {
        if let viewControllers = self.navigationController?.viewControllers {
            for viewController in viewControllers {
                if viewController.isKind(of: SecondViewController.self) {
                    navigationController?.popToViewController(viewController, animated: true)
                    break
                }
            }
        }
    }
    
    @IBAction func goToRootVC(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
