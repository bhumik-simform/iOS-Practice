//
//  ViewController.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 02/06/26.
//

import UIKit

class GoTCharacterViewController: UIViewController {

    @IBOutlet weak var charTableView: UITableView!

    let viewModel = GoTCharacterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupTable()
        bindData()

    }

    private func setupTable() {
        charTableView.dataSource = self
        charTableView.delegate = self

        charTableView.register(
            UINib(nibName: "GoTCharacterTableViewCell", bundle: nil),
            forCellReuseIdentifier: "GoTCharacterTableViewCell")
    }

    private func bindData() {
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.charTableView.reloadData()
            }
        }

        viewModel.fetchCharacters()
    }

}

extension GoTCharacterViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {

        guard
            let cell = charTableView.dequeueReusableCell(
                withIdentifier: "GoTCharacterTableViewCell")
                as? GoTCharacterTableViewCell
        else {
            return UITableViewCell()
        }
        let item = viewModel.characters[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}
