//
//  ViewController.swift
//  Template Project
//
//  Created by Benjamin Encz on 5/15/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import UIKit
import Parse
import RealmSwift
import ConvenienceKit

class firstScreenViewController: UIViewController {

    @IBOutlet weak var allTasksTableView: UITableView!
    
    
    var allMyTasks: Results<Task>! {
        didSet {
            // Whenever notes update, update the table view
            allTasksTableView?.reloadData()
        }
    }
    
    @IBAction func unwindToSegue(segue: UIStoryboardSegue) {
        
        if let identifier = segue.identifier {
            println("Identifier \(identifier)")
        }
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
