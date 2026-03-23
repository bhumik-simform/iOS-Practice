//
//  ViewController.swift
//  Demo_TableView
//
//  Created by Bhumik Poshiya on 23/03/26.
//

import UIKit

class MyTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //Raw data which will be filled in table
    let settingsOptions = ["Airplan Mode", "Wi-Fi", "Bluetooth", "Cellular", "Personal Hotspot"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //This will provide table view the instance of the protocols which it follows
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension MyTableViewController: UITableViewDelegate {
    //This function execute when user interact with any particular cell
    func tableView(_ table: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(settingsOptions[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
//    func˳
}
extension MyTableViewController: UITableViewDataSource {
    
    //Funct	ion to define how many rows there will be in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsOptions.count
    }
    
    //Function that will define that how each cell will looks like
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        
        cell.textLabel?.text = settingsOptions[indexPath.row]
        return cell
    }
    
    

}

