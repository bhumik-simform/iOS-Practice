//
//  LoginViewController.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

import UIKit

class LogInViewController: UIViewController {

    private let viewModel = LogInViewModel()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}

extension LogInViewController {
    
    @IBAction func logInBtnOnClick(_ sender: UIButton) {
        
        let emailValue = emailTextField.text ?? ""
        let passwordValue = passwordTextField.text ?? ""
        
        let responcedUser = viewModel.login(email: emailValue, password: passwordValue)
        
    }
}
