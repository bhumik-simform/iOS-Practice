//
//  CounterViewController.swift
//  05-mvvm-architecture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

import UIKit
import Combine

final class CounterViewController: UIViewController {

    @IBOutlet private weak var countLabel: UILabel!
    
    private let viewModel = CounterViewModel()
    private var cancellabels = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        // Do any additional setup after loading the view.
    }
}

extension CounterViewController {
    
    @IBAction private func incButtonTapped(_ sender: UIButton) {
        viewModel.increment()
    }
    
    @IBAction private func decButtonTapped(_ sender: UIButton) {
        viewModel.decrement()
    }
    
    @IBAction private func resetButtonTapped(_ sender: UIButton) {
        viewModel.reset()
    }
    
}

extension CounterViewController {
    
    private func bindViewModel() {
        viewModel.$count.sink{ [weak self] receiveValue in
            self?.countLabel.text = "Count: \(receiveValue)"
        }.store(in: &cancellabels)
    }
}
