//
//  CurdTableViewCell.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 03/06/26.
//

import UIKit

class CurdTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
    }
    
    func configureCell(with user: User) {
        nameLabel.text = "Name: \(user.name)"
        userNameLabel.text = "Username: \(user.userName)"
        emailLabel.text = "Email: \(user.email)"
    }
    
}
