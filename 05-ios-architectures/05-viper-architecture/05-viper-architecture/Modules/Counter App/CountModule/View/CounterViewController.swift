//
//  CounterViewController.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 30/06/26.
//

import UIKit

final class CounterViewController: UIViewController {
    
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var incButton: UIButton!
    @IBOutlet private weak var decButton: UIButton!
    

    var presenter: CounterPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

}

extension CounterViewController {
    
    @IBAction private func incButtonTapped(_ sender: UIButton) {
        presenter?.incrementTapped()
    }
    
    @IBAction private func decButtonTapped(_ sender: UIButton) {
        presenter?.decrementTapped()
    }
    
    @IBAction private func resetButtonTapped(_ sender: UIButton) {
        presenter?.resetTapped()
    }
    
    @IBAction private func colorPickerButtonTapped(_ sender: UIButton) {
        presenter?.colorPickerTapped()
    }
}

extension CounterViewController: CounterViewProtocol {
    func disabledIncButton() {
        incButton.isEnabled = false
    }
    
    func disabledDecButton() {
        decButton.isEnabled = false
    }
    
    func updateCount(_ value: String) {
        incButton.isEnabled = true
        decButton.isEnabled = true
        countLabel.text = value
    }
}
