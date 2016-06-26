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
    
    @IBAction func addAmenityCell(sender: AnyObject) {
        
        let vc = childViewControllers[0] as! EditAmenitiesTableViewController
        vc.amentyArray.append("a puppy")
        vc.tableView.reloadData()
        print(vc)
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
    
    
    
}
