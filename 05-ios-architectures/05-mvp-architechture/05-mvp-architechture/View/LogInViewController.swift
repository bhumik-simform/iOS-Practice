//
//  LogInViewController.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 26/06/26.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var logInBtn: UIButton!

    private var presenter: LogInPresenter!

    private let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = LogInPresenter(view: self)
        configActivityIndicator()
        
    }

}

extension LogInViewController {

    func configActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true

        view.addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            activityIndicator.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
        ])
    }

}

extension LogInViewController: LogInView {

    func startLoading() {
        DispatchQueue.main.async { [self] in
            userNameTextField.isEnabled = false
            passwordTextField.isEnabled = false
            logInBtn.isEnabled = false
            activityIndicator.startAnimating()
        }
    }

    func stopLoading() {

        DispatchQueue.main.async { [self] in
            userNameTextField.isEnabled = true
            passwordTextField.isEnabled = true
            logInBtn.isEnabled = true
            activityIndicator.stopAnimating()
        }
    }

    func showError(message errorMessage: String) {
        DispatchQueue.main.async {
            self.showAlert(errorMessage)
        }
    }

    func navigateHomeScreen(data result: LogInResponse) {
        DispatchQueue.main.async {
            self.navigateToUserDetails(result)
        }
    }
}

extension LogInViewController {

    @IBAction private func logInBtnTapped(_ sender: UIButton) {

        let userName = userNameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        presenter.login(userName, password)

    }

}

extension LogInViewController {

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

extension LogInViewController {

    func navigateToUserDetails(_ result: LogInResponse) {

        guard
            let destinationVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(
                    withIdentifier: "UserTasksViewController")
                as? UserTasksViewController
        else {
            return
        }

        destinationVC.userDetails = result

        if var viewControllers = self.navigationController?.viewControllers {

            viewControllers.removeLast()

            viewControllers.append(destinationVC)

            self.navigationController?.setViewControllers(
                viewControllers, animated: true)

        }
    }

}
