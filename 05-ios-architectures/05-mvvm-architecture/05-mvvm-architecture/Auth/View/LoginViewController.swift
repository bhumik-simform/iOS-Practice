//
//  ViewController.swift
//  05-mvvm-architecture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

import Combine
import UIKit

final class LoginViewController: UIViewController {

    //  MARK: IBOutlets
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

    //  MARK: Properties
    private let viewModel = LoginViewModel()
    private var cancellabels = Set<AnyCancellable>()

    //    MARK: UI Elements
    private lazy var activityIndicator = createActivityIndicator()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
}

extension LoginViewController {

    private func bindViewModel() {
        viewModel.$loginUIState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] receiveValue in

                switch receiveValue {
                case .idle: print("Idle State")
                case .loading: self?.isLoadingState(true)
                case .onSuccess(let data):
                    self?.navigateToUserTasks(with: data)
                case .onError(let message): self?.showAlert(with: message)

                }

            }.store(in: &cancellabels)
    }

    private func isLoadingState(_ isLoading: Bool) {
        userNameTextField.isEnabled = !isLoading
        passwordTextField.isEnabled = !isLoading
        loginButton.isEnabled = !isLoading

        isLoading
            ? activityIndicator.startAnimating()
            : activityIndicator.stopAnimating()
    }
}

extension LoginViewController {
    @IBAction private func onLoginButtonTapped(_ sender: UIButton) {

        let userName = userNameTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        viewModel.login(userName: userName, password: password)
    }

}

extension LoginViewController {

    private func navigateToUserTasks(with result: LoginResponse) {
        guard
            let destinationVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(
                    withIdentifier: "UserTasksViewController")
                as? UserTasksViewController
        else {
            return
        }

        destinationVC.userId = result.userId

        self.navigationController?.setViewControllers(
            [destinationVC], animated: true
        )
    }

}

extension LoginViewController {

    private func showAlert(with message: String) {

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
