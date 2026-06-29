//
//  LogInViewController.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 26/06/26.
//

import UIKit

final class LoginViewController: UIViewController {

//    MARK: IBOutlets
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

//    MARK: Properties
    private var presenter: LoginPresenter!

//    MARK: UI Element
    private lazy var activityIndicator = createActivityIndicator()

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = LoginPresenter(view: self)
       
    }

}

extension LoginViewController: LoginView {

    func startLoading() {
        DispatchQueue.main.async { [self] in
            userNameTextField.isEnabled = false
            passwordTextField.isEnabled = false
            loginButton.isEnabled = false
            activityIndicator.startAnimating()
        }
    }

    func stopLoading() {

        DispatchQueue.main.async { [self] in
            userNameTextField.isEnabled = true
            passwordTextField.isEnabled = true
            loginButton.isEnabled = true
            activityIndicator.stopAnimating()
        }
    }

    func showError(message errorMessage: String) {
        DispatchQueue.main.async {
            self.showAlert(errorMessage)
        }
    }

    func onSuccess(data result: LoginResponse) {
        DispatchQueue.main.async {
            self.navigateToUserTasks(result)
        }
    }
}

extension LoginViewController {

    @IBAction private func loginButtonTapped(_ sender: UIButton) {

        let userName = userNameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        presenter.login(userName, password)

    }

}

extension LoginViewController {

    private func showAlert(_ message: String) {

        let alert = UIAlertController(
            title: "Unexpected Error",
            message: message,
            preferredStyle: .alert
        )

        let closeAction = UIAlertAction(title: "Close", style: .cancel)

        alert.addAction(closeAction)

        present(alert, animated: true)

    }
}

extension LoginViewController {

    func navigateToUserTasks(_ result: LoginResponse) {
        
        guard
            let destinationVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(
                    withIdentifier: "UserTasksViewController")
                as? UserTasksViewController
        else {
            return
        }
        
        destinationVC.userDetails = result
        
        self.navigationController?.setViewControllers([destinationVC], animated: true)
        
    }

}
