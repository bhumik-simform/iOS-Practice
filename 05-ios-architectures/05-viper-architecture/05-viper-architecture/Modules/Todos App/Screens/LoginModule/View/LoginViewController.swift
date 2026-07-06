//
//  LoginViewController.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

import UIKit

class LoginViewController: UIViewController {

    //    MARK: IBOutlet

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    @IBOutlet private weak var loginButton: UIButton!

    var presenter: LoginPresenterProtocol?

    private lazy var activityIndicator = createActivityIndicator()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension LoginViewController {

    @IBAction private func loginButtonTapped(_ sender: UIButton) {
        presenter?.loginButtonTapped(
            userName: userNameTextField.text,
            password: passwordTextField.text
        )
    }
}

extension LoginViewController: LoginViewProtocol {

    func showLoading() {
        userNameTextField.isEnabled = false
        passwordTextField.isEnabled = false
        loginButton.isEnabled = false
        activityIndicator.startAnimating()
    }

    func hideLoading() {
        userNameTextField.isEnabled = true
        passwordTextField.isEnabled = true
        loginButton.isEnabled = true
        activityIndicator.stopAnimating()
    }

    func showError(_ message: String) {
        showAlert(with: message)
    }
    
    func showDefaultState() {
        userNameTextField.text = nil
        passwordTextField.text = nil
        hideLoading()
    }
}
