//
//  TaskTableViewCell.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

import UIKit

final class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet private var taskTitleLabel: UILabel!
    @IBOutlet private var taskStatusLabel: UILabel!
    @IBOutlet weak var taskTableViewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configure(for item: UserTask) {
        
        taskTitleLabel.text = item.title
        taskStatusLabel.text = item.isCompleted ? "Status: Completed" : "Status: Incompleted"
        taskTableViewCell.backgroundColor = item.isCompleted ? .green : .red
        
    }
}
