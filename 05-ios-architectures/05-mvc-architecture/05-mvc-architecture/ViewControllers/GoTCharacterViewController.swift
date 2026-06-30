//
//  ViewController.swift
//  05-mvc-architecture
//
//  Created by Bhumik Poshiya on 25/06/26.
//

import UIKit

class GoTCharacterViewController: UIViewController {
    
    private var characters = [GoTCharacter]()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    @IBOutlet private weak var charTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        fetchList()
        setupTable()
        
    }
}

extension GoTCharacterViewController {
    private func fetchList() {
        Task {
            characters = await fetchCharacters()
            
            await MainActor.run {
                activityIndicator.stopAnimating()
                self.charTableView.reloadData()
            }
        }
    }
    
}

extension GoTCharacterViewController {
    
    private func setupUI() {
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            activityIndicator.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            )
        ])
        
    }
    
}

extension GoTCharacterViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTable() {
        charTableView.dataSource = self
        charTableView.delegate = self
        
        charTableView.register(
            UINib(nibName: "GoTCharacterTableViewCell", bundle: nil),
            forCellReuseIdentifier: "GoTCharacterTableViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = charTableView.dequeueReusableCell(
                withIdentifier: "GoTCharacterTableViewCell")
                as? GoTCharacterTableViewCell
        else {
            return UITableViewCell()
        }
        let item = characters[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}
