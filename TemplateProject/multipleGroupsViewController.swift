//
//  multipleGroupsViewController.swift
//  TemplateProject
//
//  Created by Trisha Dwivedi on 7/16/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import UIKit

class multipleGroupsViewController: UIViewController {
    
    @IBOutlet weak var multipleGroupsTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        multipleGroupsTableView.dataSource = self
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

extension multipleGroupsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GroupTableViewCell", forIndexPath: indexPath) as! GroupTableViewCell //1
        
        let row = indexPath.row
        cell.textLabel?.text = "Group Name"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
}