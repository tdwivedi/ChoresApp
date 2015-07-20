//
//  TaskTableViewCell.swift
//  TemplateProject
//
//  Created by Trisha Dwivedi on 7/14/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var task: Task? {
        didSet {
            if let task = task, taskLabel = taskLabel, timeLabel = timeLabel {
                  self.taskLabel.text = task.title
                //self.taskLabel.text = titleTextField.text
                self.timeLabel.text = "Today"
            }
        }
    }

}
