//
//  TaskDisplayViewController.swift
//  TemplateProject
//
//  Created by Trisha Dwivedi on 7/17/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import ConvenienceKit

class TaskDisplayViewController: UIViewController {
    
    //add alerts
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!

    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        displayTask(task)
    }
    
    override func viewDidLoad() {
        contentTextView.layer.cornerRadius = 5
        contentTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        contentTextView.layer.borderWidth = 1
        contentTextView.text = " "
    }
    
    var task: Task? {
        didSet {
            displayTask(task)
        }
    }
    
    func displayTask(task: Task?) {
        if let task = task, titleTextField = titleTextField, dateTextField = dateTextField, contentTextView = contentTextView  {
            titleTextField.text = task.title
            dateTextField.text = task.endDate
            contentTextView.text = task.content
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        saveTask()
    }
    
    func saveTask() {
        if let task = task {
            let realm = Realm()
            
            realm.write {
                if (task.title != self.titleTextField.text || task.content != self.contentTextView.text) {
                    task.title = self.titleTextField.text
                    task.content = self.contentTextView.text
                    task.endDate = "Date"
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
