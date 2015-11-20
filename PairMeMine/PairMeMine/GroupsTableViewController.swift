//
//  GroupsTableViewController.swift
//  PairMeMine
//
//  Created by Benjamin Patch on 11/19/15.
//  Copyright © 2015 PatchWork. All rights reserved.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    @IBAction func addButtonPressed(sender: UIBarButtonItem) {
        
        // STEP 1: Create the alert controller and set the preferredStyle to .ActionSheet or .Alert
        let newGroupAlertController = UIAlertController(title: "New Group", message: "Name your group:", preferredStyle: .Alert)
        newGroupAlertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Group Name"
        }
        // STEP 2: Create the alertAction(s) (AKA "buttons")
        let cancelAlert =  UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let saveAlert = UIAlertAction(title: "Save", style: .Default) { (alertAction) -> Void in
            if let nameTextField = newGroupAlertController.textFields?.first {
                let group = Group(name: nameTextField.text!)
                GroupController.sharedInstance.addGroup(group)
                GroupController.sharedInstance.currentGroup = group
                self.navigationController?.popViewControllerAnimated(true)
            }
        }

        newGroupAlertController.addAction(cancelAlert)
        newGroupAlertController.addAction(saveAlert)
        

        presentViewController(newGroupAlertController, animated: true, completion: nil)
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GroupController.sharedInstance.groups.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("groupCell", forIndexPath: indexPath)
        cell.textLabel?.text = GroupController.sharedInstance.groups[indexPath.row].name
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        GroupController.sharedInstance.currentGroup = GroupController.sharedInstance.groups[indexPath.row]

        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let removeGroup = GroupController.sharedInstance.groups[indexPath.row]
            if removeGroup != GroupController.sharedInstance.currentGroup {
                GroupController.sharedInstance.removeGroup(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            } else {
                // Present an alert informing the user that you cannot delet the current group.
                let invalidRequestAlertController = UIAlertController(title: "Invalid Deletion", message: "Sorry, you cannot delete the currently selected group.", preferredStyle: .Alert)
                let doneAlert =  UIAlertAction(title: "Done", style: .Default, handler: nil)
                invalidRequestAlertController.addAction(doneAlert)
                presentViewController(invalidRequestAlertController, animated: true, completion: nil)
                tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
            }
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
