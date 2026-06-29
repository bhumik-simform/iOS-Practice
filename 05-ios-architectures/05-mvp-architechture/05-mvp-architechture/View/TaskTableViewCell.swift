//
//  TaskTableViewCell.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet private var taskTitle: UILabel!
    @IBOutlet private var taskStatus: UILabel!
    @IBOutlet weak var taskTableViewCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configCell(for item: UserTask) {
        
        taskTitle.text = item.title
        taskStatus.text = item.statusInString()
        taskTableViewCell.backgroundColor = item.setBackGroundColour()
        
    }
}
