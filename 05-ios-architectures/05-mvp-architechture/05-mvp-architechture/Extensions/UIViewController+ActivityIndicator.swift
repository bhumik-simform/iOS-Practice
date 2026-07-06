//
//  UIViewController+ActivityIndicator.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

import UIKit

extension UIViewController {

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
}
