//
//  HomeViewController.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 06/04/26.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToSecondVCClick(_ sender: Any) {
        if let secondViewController = UIStoryboard(name: "ProgNav", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
}

