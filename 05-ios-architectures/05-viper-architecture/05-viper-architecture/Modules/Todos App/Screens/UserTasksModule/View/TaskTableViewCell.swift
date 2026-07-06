//
//  TaskTableViewCellTableViewCell.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 06/07/26.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet private weak var taskLabel: UILabel!
    @IBOutlet private weak var checkCircleStatusImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with task: UserTask) {

        taskLabel.text = task.taskTitle
        
        checkCircleStatusImageView.image = task.isCompleted ? UIImage(systemName: "circle") :
        UIImage(systemName:  "checkmark.circle.fill")
    }
}
