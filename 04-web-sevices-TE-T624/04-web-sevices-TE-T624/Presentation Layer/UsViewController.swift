//
//  AddPersonViewController.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 03/06/26.
//

import UIKit

class UsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var userNameTextField: UITextField!

    @IBOutlet weak var emailTextField: UITextField!

    var onAddUSer: ((String, String, String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
    }

    private func setupNavigationBar() {

        let cancelButton = UIBarButtonItem(
            title: "Cancel", image: nil, target: self,
            action: #selector(cancelButtonTapped))

        self.title = "Add User"
        self.navigationItem.leftBarButtonItem = cancelButton

    }

    @objc
    private func cancelButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UsViewController {

    @IBAction func onClickAddPerson(_ sender: UIButton) {

        guard let name = nameTextField.text,
            let userName = userNameTextField.text,
            let email = emailTextField.text
        else { return }

        onAddUSer?(name, userName, email)
        
        self.dismiss(animated: true)

    }
}
