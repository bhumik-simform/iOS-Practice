//
//  ViewController.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 26/06/26.
//

import UIKit

class CounterViewController: UIViewController {

    
    @IBOutlet weak var countLabel: UILabel!
    
    private var presenter: CounterPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = CounterPresenter(view: self)
        presenter.viewDidLoad()
    }
}

extension CounterViewController {
    
    @IBAction private func incBtnTapped(_ sender: UIButton) {
        presenter.increment()
    }
    
    
    @IBAction private func decBtnTapped(_ sender: UIButton) {
        presenter.decrement()
    }
    
    @IBAction private func resetBtnTapped(_ sender: UIButton) {
        presenter.reset()
    }
}

extension CounterViewController: CounterView {
    func showCount(_ count: Int) {
        countLabel.text = String(count)
    }
}
