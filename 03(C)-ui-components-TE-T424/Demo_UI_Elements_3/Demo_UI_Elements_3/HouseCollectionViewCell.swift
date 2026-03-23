//
//  HouseCollectionViewCell.swift
//  Demo_UI_Elements_3
//
//  Created by Bhumik Poshiya on 27/03/26.
//

import UIKit

class HouseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var houseSigilImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //Reseting Cell Befor Reusing it
        houseSigilImageView.image = nil
        houseNameLabel.text = ""
    }
}
