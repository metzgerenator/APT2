//
//  EditPropertyDetailsTableViewController.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class EditPropertyDetailsTableViewController: UITableViewController {
    
    
    @IBOutlet var apartmentNameTextField: UITextField!
    
    @IBOutlet var addressNameTextField: UITextField!
    
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var rentFrequency: UILabel!
    
    @IBOutlet var numberBedroomLbel: UILabel!
    
    
    @IBOutlet var numberBathroomsLabel: UILabel!
    
    
    @IBOutlet var bedroomStepperOutlet: UIStepper!
    
    @IBAction func bedroomStepper(sender: UIStepper) {
        
         numberBedroomLbel.text = Int(sender.value).description
    }
    
    
    
    @IBOutlet var bathroomStepperOutlet: UIStepper!
    
    @IBAction func bathroomStepper(sender: UIStepper) {
      
        
        numberBathroomsLabel.text = Int(sender.value).description
        
    }

    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        
        print("unwinding now")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Setup Stepper
        bedroomStepperOutlet.wraps = true
        bedroomStepperOutlet.autorepeat = true
        bedroomStepperOutlet.maximumValue = 10
        
        bathroomStepperOutlet.wraps = true
        bathroomStepperOutlet.autorepeat = true
        bathroomStepperOutlet.maximumValue = 10
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
