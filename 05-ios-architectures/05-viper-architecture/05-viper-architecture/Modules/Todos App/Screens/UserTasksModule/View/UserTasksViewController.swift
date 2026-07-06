//
//  UserTasksViewController.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 03/07/26.
//

import UIKit

final class UserTasksViewController: UIViewController {

    @IBOutlet private weak var userTaskTableView: UITableView!

    var presenter: UserTasksPresenterProtocol!
    var userId: Int?

    private lazy var activityIndicator = createActivityIndicator()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}

extension UserTasksViewController {

    private func setupUI() {

        self.navigationItem.hidesBackButton = true
        setupTable()

        guard let userId else {
            showAlert(with: "Cannot Find UserId")
            return
        }

        presenter?.fetchTasks(for: userId)
    }

    private func setupTable() {

        userTaskTableView.register(
            UINib(nibName: "TaskTableViewCell", bundle: nil),
            forCellReuseIdentifier: "TaskTableViewCell"
        )

        userTaskTableView.dataSource = self

    }

}

extension UserTasksViewController: UserTasksViewProtocol {
    func showLoadingState() {
        userTaskTableView.isHidden = true
        activityIndicator.startAnimating()
    }

    func hideLoadingState() {
        userTaskTableView.isHidden = false
        activityIndicator.stopAnimating()
    }

    func showError(_ message: String) {
        showAlert(with: message)
    }

    func onSucess() {
        userTaskTableView.reloadData()
    }
}

extension UserTasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        presenter.numberOfTasks()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "TaskTableViewCell") as? TaskTableViewCell
        else {
            return UITableViewCell()
        }

        let item = presenter.task(at: indexPath.row)
        cell.configure(with: item)
        return cell
    }
}
