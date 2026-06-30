//
//  CounterViewController.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 30/06/26.
//

import UIKit

final class CounterViewController: UIViewController {
    
    @IBOutlet private weak var countLabel: UILabel!

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
    
}

extension CounterViewController: CounterViewProtocol {
    func updateCount(_ value: String) {
        countLabel.text = value
    }
}
