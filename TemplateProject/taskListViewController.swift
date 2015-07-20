//
//  taskListViewController.swift
//  TemplateProject
//
//  Created by Trisha Dwivedi on 7/14/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import UIKit
import RealmSwift

class taskListViewController: UIViewController {

    @IBOutlet weak var taskListTableView: UITableView!
    
    var selectedTask:Task!
    
    var tasks: Results<Task>! {
        didSet {
            // Whenever notes update, update the table view
            taskListTableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        //let realm = Realm()
        super.viewDidLoad()
        taskListTableView.dataSource = self
        taskListTableView.delegate = self
        //tasks = realm.objects(Task).sorted("endDate", ascending: false)
        
        //tasks = realm.objects(Task)
        
        //realm.deleteAll()
        /*let myTask = Task()
        myTask.title   = "Test Task!!!!!"
        myTask.content = "A long piece of content"
        
        let realm = Realm() // 1
        realm.write() { // 2
            realm.add(myTask) // 3
        }
        
        tasks = realm.objects(Task)*/
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let realm = Realm()
        //tasks = realm.objects(Task).sorted("modificationDate", ascending: false)
        tasks = realm.objects(Task)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToSegue(segue: UIStoryboardSegue) {
        
        if let identifier = segue.identifier { let realm = Realm()
            switch identifier {
            case "Save":
                let source = segue.sourceViewController as! NewTaskViewController
                
                realm.write() {
                    realm.add(source.currentTask!)
                }
            case "Delete":
                realm.write() {
                    realm.delete(self.selectedTask!)
                }
                
                let source = segue.sourceViewController as! TaskDisplayViewController
                source.task = nil;
                
            default:
                println("No one loves \(identifier)")
            }
            
            //tasks = realm.objects(Task).sorted("endDate", ascending: false)
            tasks = realm.objects(Task)
        }
        
         func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if (segue.identifier == "ShowExistingTask") {
                let taskViewController = segue.destinationViewController as! TaskDisplayViewController
                taskViewController.task = selectedTask
            }
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

extension taskListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath) as! TaskTableViewCell //1
        
        let row = indexPath.row
        let task = tasks[row] as Task
        cell.task = task
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(tasks?.count ?? 0)
    }
    
}

extension taskListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedTask = tasks[indexPath.row]      //1
        self.performSegueWithIdentifier("ShowExistingTask", sender: self)     //2
    }
    
    // 3
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // 4
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == .Delete) {
            let task = tasks[indexPath.row] as Object
            
            let realm = Realm()
            
            realm.write() {
                realm.delete(task)
            }
            
            //tasks = realm.objects(Task).sorted("endDate", ascending: false)
            tasks = realm.objects(Task) 
        }
    }
    
}
