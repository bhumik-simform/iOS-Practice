//
//  UserTasksViewController.swift
//  05-mvvm-architecture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

import Combine
import UIKit

final class UserTasksViewController: UIViewController {

    //    MARK: IBOutlets
    @IBOutlet private weak var userTaskTableView: UITableView!

    //    MARK: Properties
    private let viewModel = UserTasksViewModel()
    private var cancellabels = Set<AnyCancellable>()

    //    MARK: UI Element
    private lazy var activtyIndicator = createActivityIndicator()

    //    MARK: Data
    var userId: Int!

    //    MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupTable()
    }
}

extension UserTasksViewController {

    //    MARK: Setup UI state according to view model.
    private func bindViewModel() {
        viewModel.$userTasksUIState.receive(on: DispatchQueue.main).sink {
            [weak self] reciveValue in

            guard let self else { return }

            switch reciveValue {
            case .idle: self.fetchTasks()
            case .loading: self.isLoadingState(true)
            case .onSuccess:
                self.isLoadingState(false)
                self.userTaskTableView.reloadData()
            case .onError(let message):
                self.isLoadingState(false)
                self.showAlert(with: message)
            }
        }.store(in: &cancellabels)
    }

    //  MARK: On idle on initial state
    private func fetchTasks() {
        if let userId {
            viewModel.fetchUsersTask(for: userId)
        } else {
            showAlert(with: "Can not Get UserId")
        }
    }

    //    MARK: Loading State
    private func isLoadingState(_ isLoading: Bool) {
        if isLoading {
            userTaskTableView.isHidden = true
            activtyIndicator.startAnimating()
        } else {
            userTaskTableView.isHidden = false
            activtyIndicator.stopAnimating()
        }
    }

    //   MARK: On error state
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

extension UserTasksViewController {

    private func setupTable() {
        userTaskTableView.register(
            UINib(nibName: "TaskTableViewCell", bundle: nil),
            forCellReuseIdentifier: "TaskTableViewCell"
        )

        userTaskTableView.dataSource = self
        userTaskTableView.delegate = self
    }
}

extension UserTasksViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        viewModel.numberOfTasks()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        guard
            let cell = userTaskTableView.dequeueReusableCell(
                withIdentifier: "TaskTableViewCell") as? TaskTableViewCell
        else {
            return UITableViewCell()
        }

        let task = viewModel.task(at: indexPath.row)
        cell.configure(item: task)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
