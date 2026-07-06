//
//  TableViewCell.swift
//  05-mvc-architecture
//
//  Created by Bhumik Poshiya on 25/06/26.
//

import UIKit

class GoTCharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with character: GoTCharacter) {
        
        nameLabel.text = character.fullName
        houseLabel.text = character.family
        titleLabel.text = character.title
    }
    
}
