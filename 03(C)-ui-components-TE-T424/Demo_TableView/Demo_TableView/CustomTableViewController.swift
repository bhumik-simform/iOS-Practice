//
//  CustomTableViewController.swift
//  Demo_TableView
//
//  Created by Bhumik Poshiya on 24/03/26.
//

import UIKit
class CustomTableViewController: UIViewController {
    
    @IBOutlet weak var customCellTable: UITableView!
    
    let settingsOptions = ["Airplan Mode", "Wi-Fi", "Bluetooth", "Cellular", "Personal Hotspot"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customCellTable.register( UINib(nibName: "SwitchTableViewCell", bundle: nil), forCellReuseIdentifier: "SwitchTableViewCell")
        customCellTable.dataSource = self
    }
}

extension CustomTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = customCellTable.dequeueReusableCell(withIdentifier: "SwitchTableViewCell", for: indexPath) as! SwitchTableViewCell
        myCell.settingLabel.text = settingsOptions[indexPath.row]
        return myCell
    }
}
