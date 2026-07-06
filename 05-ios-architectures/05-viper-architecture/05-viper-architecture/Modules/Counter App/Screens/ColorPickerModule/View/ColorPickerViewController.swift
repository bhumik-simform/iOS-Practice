//
//  ColorPickerViewController.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 02/07/26.
//

import UIKit

class ColorPickerViewController: UIViewController {

    @IBOutlet private weak var countLabel: UILabel!
    
    var presenter: ColorPickerPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        
    }
    
}

extension ColorPickerViewController: ColorPickerViewProtocol {
    func updateColor(_ color: UIColor) {
        countLabel.textColor = color
    }
}

extension ColorPickerViewController {
    
    @IBAction private func redButtonTapper(_ sender: UIButton) {
        presenter?.redTapped()
    }
    
    @IBAction private func blackButtonTapper(_ sender: UIButton) {
        presenter?.blackTapped()
    }
    
    @IBAction private func blueButtonTapper(_ sender: UIButton) {
        presenter?.blueTapped()
    }
    
    @IBAction private func greenButtonTapper(_ sender: UIButton) {
        presenter?.greenTapped()
    }
    
    @IBAction private func goToBackCounter(_ sender: UIButton) {
        presenter?.goBackCounterTapped()
    }
}
