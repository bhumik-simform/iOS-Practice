//
//  WelcomeVC.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 07/04/26.
//

import UIKit

class WelcomeVC: UIViewController {

    weak var coordinator: OnboardingCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func goToProfileVCClicked(_ sender: UIButton) {
        coordinator?.gotoProfileSetup()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
