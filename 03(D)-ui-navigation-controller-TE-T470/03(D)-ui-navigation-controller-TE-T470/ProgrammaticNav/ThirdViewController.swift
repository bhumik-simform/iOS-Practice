//
//  ThirdViewController.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 06/04/26.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func seeTheFourthVCClicked(_ sender: UIButton) {
        if let fourthVC = UIStoryboard(name: "ProgNav", bundle: nil).instantiateViewController(withIdentifier: "FourthViewController") as? FourthViewController {
            navigationController?.pushViewController(fourthVC, animated: true)
            //            navigationController?.present(fourthVC, animated: true)
            
        }
    }
}
