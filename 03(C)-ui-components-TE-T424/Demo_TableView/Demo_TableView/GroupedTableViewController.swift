//
//  GroupedTableViewController.swift
//  Demo_TableView
//
//  Created by Bhumik Poshiya on 24/03/26.
//

import UIKit

class GroupedTableViewController: UIViewController {
    @IBOutlet weak var groupedTable: UITableView!
    
    struct SettingsSection {
        let headerTitle: String
        let items: [String]
    }

    let tableData: [SettingsSection] = [
        SettingsSection(headerTitle: "Network", items: ["Airplane Mode", "Wi-Fi", "Bluetooth", "Cellular", "Personal Hotspot", "VPN"]),
        SettingsSection(headerTitle: "Notifications & Sounds", items: ["Notifications", "Sounds & Haptics", "Focus", "Screen Time"]),
        SettingsSection(headerTitle: "Device & Appearance", items: ["General", "Control Center", "Display & Brightness", "Home Screen", "Accessibility", "Wallpaper", "StandBy"]),
        SettingsSection(headerTitle: "Security & Privacy", items: ["Siri & Search", "Face ID & Passcode", "Emergency SOS", "Exposure Notifications", "Battery", "Privacy & Security"]),
        SettingsSection(headerTitle: "Default Apps", items: ["App Store", "Wallet & Apple Pay", "Passwords", "Mail", "Contacts", "Calendar", "Notes", "Reminders", "Freeform", "Voice Memos"]),
        SettingsSection(headerTitle: "Media Apps", items: ["Phone", "Messages", "FaceTime", "Safari", "News", "Translate", "Maps", "Shortcuts", "Health", "Fitness", "Photos", "Camera", "Books", "Podcasts", "TV", "Music"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        groupedTable.register(UINib(nibName: "SwitchTableViewCell", bundle: nil), forCellReuseIdentifier: "SwitchTableViewCell")
        groupedTable.register(UINib(nibName: "IconTableViewCell", bundle: nil), forCellReuseIdentifier: "IconTableViewCell")
        groupedTable.dataSource = self
    }
}

extension GroupedTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var totalRows = indexPath.row
        for section in 0..<indexPath.section {
            totalRows += tableView.numberOfRows(inSection: section)
        }
        
        if(tableData[indexPath.section].headerTitle == "Network") {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchTableViewCell", for: indexPath) as? SwitchTableViewCell else  {
                return UITableViewCell()
            }
            cell.settingLabel.text = tableData[indexPath.section].items[indexPath.row]
            if(totalRows % 2 == 0) {
                cell.backgroundColor = .red
            } else {
                cell.backgroundColor = .blue
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "IconTableViewCell", for: indexPath) as? IconTableViewCell else {
                return UITableViewCell()
            }
            cell.lblSetting.text = tableData[indexPath.section].items[indexPath.row]
            if(totalRows % 2 == 0) {
                cell.backgroundColor = .red
            } else {
                cell.backgroundColor = .blue
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableData[section].headerTitle
    }
}
