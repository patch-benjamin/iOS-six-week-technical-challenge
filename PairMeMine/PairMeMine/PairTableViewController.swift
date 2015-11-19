//
//  PairTableViewController.swift
//  PairMeMine
//
//  Created by Benjamin Patch on 11/18/15.
//  Copyright © 2015 PatchWork. All rights reserved.
//

import UIKit

class PairTableViewController: UITableViewController {
    
    var group: Group {
        get {
            return GroupController.sharedInstance.currentGroup
        }
    }
    
    @IBOutlet weak var groupNameLabel: UILabel!
    
    var randomizedPersons: [[Person]] = []
    
    var pairingSize: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        groupNameLabel.text = group.name
        randomizedPersons = GroupController.randomizePersons(self.group, pairingSize: pairingSize)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: Actions
    @IBAction func uploadButtonTapped(sender: UIBarButtonItem) {
        
        var message: String = "Here is my randomized group:\n\n"
        
        for var i = 0; i < randomizedPersons.count; i++ {
            let groupArray = randomizedPersons[i]
            message += "Group \(i + 1): "
            groupArray.forEach({ (person) -> () in
                person == groupArray.last ? (message += "and \(person.name)") : (message += "\(person.name), ")
            })
            message += "\n\n"
        }
        message += "\n\nI created this list using PairMeMine. Download in the App Store!"
        let actionVC = UIActivityViewController(activityItems: [message], applicationActivities: [])
        
        presentViewController(actionVC, animated: true, completion: nil)
    }
    
    @IBAction func RandomizeButtonTapped(sender: UIButton) {
        
        randomizedPersons = GroupController.randomizePersons(group, pairingSize: 2)
        
        tableView.reloadData()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return randomizedPersons.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return randomizedPersons[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let person = randomizedPersons[indexPath.section][indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("pairedUserCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = "Member \(indexPath.row + 1)"
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group \(section + 1)"
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(30)
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(30)
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
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}

