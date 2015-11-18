//
//  PeopleTableViewController.swift
//  PairMeMine
//
//  Created by Benjamin Patch on 11/18/15.
//  Copyright © 2015 PatchWork. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func newPersonButtonTapped(sender: UIBarButtonItem) {
        
        let newPersonAlertController = UIAlertController(title: "Add Person", message: "Enter the name of ther person below:", preferredStyle: .Alert)
        
        newPersonAlertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "First Name"
        }
        
        newPersonAlertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Last Name"
        }
        
        let cancelAlert =  UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let addAlert = UIAlertAction(title: "Add User", style: .Default) { (alertAction) -> Void in
            
            if let firstNameTextField = newPersonAlertController.textFields?.first,
                lastnameTextField = newPersonAlertController.textFields?[1] {
                
                    if let firstName = firstNameTextField.text, lastName = lastnameTextField.text {
                
                    PersonController.sharedInstance.addPerson(Person(firstName: firstName, lastName: lastName))
                    self.tableView.reloadData()
                
                } else {
                    print("AddAlertAction: textField was found, but textField.text was nil.")
                }
            
            } else {
                print("AddAlertAction: newPersonAlertController.textFields.first was nil.")
            }
        }
        
        // STEP 3: Add the alertAction(s) to the alertController
        newPersonAlertController.addAction(cancelAlert)
        newPersonAlertController.addAction(addAlert)
 
        // STEP 4: Present the Alert Controller
        presentViewController(newPersonAlertController, animated: true, completion: nil)
        
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PersonController.sharedInstance.persons.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("customPersonCell", forIndexPath: indexPath) as? PersonTableViewCell {
            
            let person = PersonController.sharedInstance.persons[indexPath.row]
            
            cell.delegate = self
            cell.index = indexPath.row
            cell.usernameLabel.text = person.name
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("noUserCell", forIndexPath: indexPath)
            return cell
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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


extension PeopleTableViewController: personTableViewCellDelegate {
    // TODO: implement persontableviewdelegate
    func userEditButtonTapped(index: Int?) {
        if let index = index {
            let person = PersonController.sharedInstance.persons[index]
            
            let editPersonAlertController = UIAlertController(title: "Edit Person", message: "Edit the name of ther person below:", preferredStyle: .Alert)
            
            editPersonAlertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
                            textField.text = person.firstName
            }
            
            editPersonAlertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
                textField.placeholder = "Last Name"
            }
            
            let cancelAlert =  UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            let saveAlert = UIAlertAction(title: "Save", style: .Default) { (alertAction) -> Void in
                
                if let firstNameTextField = editPersonAlertController.textFields?.first,
                    lastnameTextField = editPersonAlertController.textFields?[1]{
                        
                        if let firstName = firstNameTextField.text, let lastName = lastnameTextField.text {
                            
                            PersonController.sharedInstance.editPerson(Person(firstName: firstName, lastName: lastName), index: index)
                
                            self.tableView.reloadData()
                            
                        } else {
                            
                            print("EditAlertAction: textField was found, but textField.text was nil.")
                            
                        }
                        
                } else {
                    
                    print("EditAlertAction: EditPersonAlertController.textFields.first was nil.")
                
                }
            }
            
            // STEP 3: Add the alertAction(s) to the alertController
            editPersonAlertController.addAction(cancelAlert)
            editPersonAlertController.addAction(saveAlert)
            
            // STEP 4: Present the Alert Controller
            presentViewController(editPersonAlertController, animated: true, completion: nil)
            
        } else {
            print("Invalid Index when trying to edit user!")
        }
    }
    
}
