//
//  CurdViewController.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 03/06/26.
//

import UIKit

class CurdViewController: UIViewController {

    private let viewModel = CurdViewModel()

    @IBOutlet weak var userTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        bindData()

    }

    private func setupTableView() {
        userTableView.register(
            UINib(nibName: "CurdTableViewCell", bundle: nil),
            forCellReuseIdentifier: "CurdTableViewCell"
        )

        userTableView.dataSource = self
        userTableView.delegate = self
    }

    private func bindData() {

        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.userTableView.reloadData()
            }
        }

        viewModel.fetchUsers()

    }
}

extension CurdViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        viewModel.userList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        guard
            let cell = userTableView.dequeueReusableCell(
                withIdentifier: "CurdTableViewCell") as? CurdTableViewCell
        else {
            return UITableViewCell()
        }

        let item = viewModel.userList[indexPath.row]
        cell.configureCell(with: item)
        return cell
    }

    func tableView(
        _ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {

        tableView.deselectRow(at: indexPath, animated: true)

        let item = viewModel.userList[indexPath.row]
        showEditUserAlertBox(user: item)

    }

    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        
        let swipedItem = viewModel.userList[indexPath.row]
        
        
        let deleteAction = UIContextualAction(
            style: .destructive, title: "Delete"
        ) { [weak self]  _, _, completion in
            
            self?.viewModel.deleteUser(userId: swipedItem.id)
            completion(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }

}

extension CurdViewController {

    @IBAction func onClickAddPerson(_ sender: UIBarButtonItem) {
        showAddUserAlertBox()
    }
}

extension CurdViewController {

    private func showAddUserAlertBox() {
        let alertBox = UIAlertController(
            title: "Add User",
            message: "Please enter details of new user below.",
            preferredStyle: .alert)

        alertBox.addTextField { textField in
            textField.placeholder = "Name"
            textField.autocapitalizationType = .words
        }

        alertBox.addTextField { textField in
            textField.placeholder = "User Name"
        }

        alertBox.addTextField { textField in
            textField.placeholder = "Email Address"
        }

        let saveBtn = UIAlertAction(title: "Save", style: .default) { _ in

            let name = alertBox.textFields?[0].text ?? ""
            let userName = alertBox.textFields?[1].text ?? ""
            let email = alertBox.textFields?[2].text ?? ""

            self.viewModel.createUser(
                name: name, userName: userName, email: email)

        }

        let cancelBtn = UIAlertAction(
            title: "Cancel", style: .cancel, handler: nil)

        alertBox.addAction(saveBtn)
        alertBox.addAction(cancelBtn)

        self.present(alertBox, animated: true)
    }

    private func showEditUserAlertBox(user: User) {
        let alertBox = UIAlertController(
            title: "Edit User",
            message: "Please change details of \(user.name) below.",
            preferredStyle: .alert)

        alertBox.addTextField { textField in
            textField.placeholder = "Name"
            textField.text = user.name
        }

        alertBox.addTextField { textField in
            textField.placeholder = "User Name"
            textField.text = user.userName
        }

        alertBox.addTextField { textField in
            textField.placeholder = "Email"
            textField.text = user.email
        }

        let saveBtn = UIAlertAction(title: "Save", style: .default) { _ in

            let name = alertBox.textFields?[0].text ?? ""
            let userName = alertBox.textFields?[1].text ?? ""
            let email = alertBox.textFields?[2].text ?? ""

            self.viewModel.editUser(
                originalUser: user, name: name, userName: userName, email: email
            )

        }

        let cancelBtn = UIAlertAction(
            title: "Cancel", style: .cancel, handler: nil)

        alertBox.addAction(saveBtn)
        alertBox.addAction(cancelBtn)

        self.present(alertBox, animated: true)
    }

}
