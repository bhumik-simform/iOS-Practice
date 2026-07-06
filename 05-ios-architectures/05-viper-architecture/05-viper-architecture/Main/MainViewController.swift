//
//  MainViewController.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 02/07/26.
//

import UIKit

class MainViewController: UIViewController {

    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction private func counterAppButtonTapped() {
        coordinator?.goToCounterApp()
    }

    @IBAction private func networkServiceAppButtonTapped() {
        coordinator?.goToTodosApp()
    }
}
