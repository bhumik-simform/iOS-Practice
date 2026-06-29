//
//  UserDetailsViewController.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 26/06/26.
//

import UIKit

class UserTasksViewController: UIViewController {
    
    var userDetails: LogInResponse?
    
    private var presenter: UserTasksPresenter!
    
    @IBOutlet private var userTasksTableView: UITableView!
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = UserTasksPresenter(self)
        setUpActivityIndicator()
        setUpTable()
        fetchData()
    }
}

extension UserTasksViewController {
    
    private func fetchData() {
        
        if let userId = userDetails?.id {
            presenter.fetchTasks(for: userId)
        } else {
            showAlert("UserId is not available.")
        }
        
    }
    
}

extension UserTasksViewController: UserTasksView {
    func startLoding() {
        userTasksTableView.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func stopLoding() {
        userTasksTableView.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    func onSucess(data: [UserTask]) {
        userTasksTableView.reloadData()
    }
    
    func onError(message: String) {
        showAlert(message)
    }
}

extension UserTasksViewController {
    
    private func setUpTable() {
        
        userTasksTableView.register(
            UINib(nibName: "TaskTableViewCell", bundle: nil),
            forCellReuseIdentifier: "TaskTableViewCell"
        )
        
        userTasksTableView.dataSource = self
        userTasksTableView.delegate = self
        
    }
    
    private func setUpActivityIndicator() {
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

extension UserTasksViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getTasksCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = userTasksTableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as? TaskTableViewCell else {
            return UITableViewCell()
        }
        
        let item = presenter.getTaskAt(indexPath.row)
        
        cell.configCell(for: item)
        return cell
    }
}
