//
//  groupViewController.swift
//  TemplateProject
//
//  Created by Trisha Dwivedi on 7/13/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import UIKit
import Parse

class groupViewController: UIViewController {

    @IBOutlet weak var groupNameLabel: UILabel!
    
    @IBOutlet weak var groupTableView: UITableView!
    
    var users = [PFUser]()
    
    //add a dictionary - key is member name, value is array
    var taskDictionary = [String:[Task]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTableView.dataSource = self
        //groupTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToSegue(segue: UIStoryboardSegue) {
        
        if let identifier = segue.identifier {
            println("Identifier \(identifier)")
        }
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
    
    /*extension groupViewController: UITableViewDataSource { //extensions can also be added by putting the name after the colon after a comma at the very beginning of the class declaration
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 5
        }
        
        /*func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            return
        }*/
        
    }*/

    extension groupViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemberTableViewCell", forIndexPath: indexPath) as! MemberTableViewCell //1
        
        let row = indexPath.row
        cell.textLabel?.text = "Member Name"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
}

