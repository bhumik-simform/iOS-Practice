//
//  UserDetailsViewController.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 26/06/26.
//

import UIKit

final class UserTasksViewController: UIViewController {
    
//    MARK: IBOutlet
    @IBOutlet private var userTasksTableView: UITableView!
   
//    MARK: Properties
    private var presenter: UserTasksPresenter!
    
//    MARK: Data
    var userDetails: LogInResponse?
    
    
    
    private lazy var activityIndicator = createActivityIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = UserTasksPresenter(self)
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
    
    func startLoading() {
        userTasksTableView.isHidden = true
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        userTasksTableView.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    func onSuccess(data: [UserTask]) {
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
        return presenter.numberOfTasks()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = userTasksTableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as? TaskTableViewCell else {
            return UITableViewCell()
        }
        
        let item = presenter.task(at: indexPath.row)
        cell.configure(for: item)
        return cell
    }
}
