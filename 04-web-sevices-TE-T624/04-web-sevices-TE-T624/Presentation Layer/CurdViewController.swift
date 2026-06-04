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

}


extension CurdViewController {
    
    @IBAction func onClickAddPerson(_ sender: UIBarButtonItem) {

        guard
            let targetVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(
                    withIdentifier: "UsViewController")
                as? UsViewController
        else {
            return
        }
        
        targetVC.isModalInPresentation = true

        targetVC.onAddUSer = { [weak self] name, userName, email in
            
            self?.viewModel.createUser(name: name, userName: userName, email: email)
        }
        
        
        let navController = UINavigationController(rootViewController: targetVC)
        self.present(navController, animated: true)
    }
    
}
