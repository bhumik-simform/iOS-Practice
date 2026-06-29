//
//  TaskTableViewCell.swift
//  05-mvvm-architecture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet private var taskTitleLabel: UILabel!
    @IBOutlet private var checkCircleStatusImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(item: UserTask) {
        
        taskTitleLabel.text = item.title
        if item.isCompleted {
            taskTitleLabel.textColor = .secondaryLabel
            checkCircleStatusImage.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            taskTitleLabel.textColor = .label
            checkCircleStatusImage.image = UIImage(systemName: "circle")
        }
    }
    
}
