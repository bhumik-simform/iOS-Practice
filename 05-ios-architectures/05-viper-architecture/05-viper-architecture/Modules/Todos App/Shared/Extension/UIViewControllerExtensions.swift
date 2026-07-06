//
//  UIViewController+ActivityInidcaotr.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

import UIKit

extension UIViewController {

    // MARK: Foe Implementating activity indicator in ViewController
    func createActivityIndicator() -> UIActivityIndicatorView {

        let indicator = UIActivityIndicatorView(style: .large)

        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(indicator)

        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        return indicator
    }
    
    // MARK: For showing Alert Dialog box on View Controller When Erro Occured
    func showAlert(with message: String) {
        let alert = UIAlertController(
            title: "Unexpected Error",
            message: message,
            preferredStyle: .alert
        )

        let closeAction = UIAlertAction(title: "Close", style: .cancel)

        alert.addAction(closeAction)

        self.present(alert, animated: true)
    }
}
