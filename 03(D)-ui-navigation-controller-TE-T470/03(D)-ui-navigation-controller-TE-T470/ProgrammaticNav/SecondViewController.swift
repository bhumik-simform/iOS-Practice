//
//  SecondViewController.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 06/04/26.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func goToThirdClicked(_ sender: Any) {
        if let thirdViewContrller = UIStoryboard(name: "ProgNav", bundle: nil).instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController {
            navigationController?.pushViewController(thirdViewContrller, animated: true)
        }
        
    }
}
