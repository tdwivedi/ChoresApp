//
//  createNewGroupViewController.swift
//  TemplateProject
//
//  Created by Trisha Dwivedi on 7/16/15.
//  Copyright (c) 2015 Make School. All rights reserved.
//

import UIKit
import RealmSwift

class createNewGroupViewController: UIViewController {

    @IBOutlet weak var newGroupName: UITextField!
    
    @IBOutlet weak var newMemberName: UITextField!
    
    @IBOutlet weak var newMemberPhone: UITextField!
    
    @IBOutlet weak var addMemberButton: UIButton!
    
    var groupsVC: multipleGroupsViewController?
    
    @IBAction func addMemberButtonTapped(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        var addedGroup = Group()
        addedGroup.groupName = newGroupName.text
        //need to access multipleGroupsViewController's groups array
        
        groupsVC!.groups.realm.add(addedGroup)
        
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //let doneTransition = storyboard.instantiateViewControllerWithIdentifier("multipleGroupsViewController") as! UIViewController
        //presentViewController(doneTransition, animated:true, completion:nil)
        //performSegueWithIdentifier("ShowAllGroups", sender: self)
        
    }
    
    var newGroup: Group?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        newGroup = Group()
        newGroup?.groupName = "GROOOOOOP"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let realm = Realm()
        
        //groupsVC!.groups = realm.objects(Group)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGroupName.delegate = self
        // Do any additional setup after loading the view.
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

extension createNewGroupViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
