//
//  GotTableViewCell.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 02/06/26.
//

import UIKit

class GoTCharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characerImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var houseLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
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
        characerImage.loadImagefrom(url: character.imageUrl)
    }
}
