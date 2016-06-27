//
//  AddAmenityViewController.swift
//  APT2
//
//  Created by Michael Metzger  on 6/26/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class AddAmenityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var availableAmenities = ["pool", "rooftop", "kitchen", "bed"]
    
    var amenitiesToSave:Dictionary = [String : Bool]()
    
    
    @IBOutlet weak var tableView: UITableView!
    

    @IBAction func cancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        
        if amenityTextField.text?.characters.count > 0 {
            amenitiesToSave.updateValue(true, forKey: "\(amenityTextField.text)")
            
            
        }
        
        self.performSegueWithIdentifier("amenity", sender: nil)
        
        
    }
    
    
    
    @IBOutlet var amenityTextField: UITextField!
    
  
    

  
    override func viewDidLoad() {
        super.viewDidLoad()
     
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "amenity" {
            
            let vc = segue.destinationViewController as! EditPropertyDetailsTableViewController
            
           vc.currentAmenities = amenitiesToSave
            
        }
    }
    
    
    
    //MARK: Table view methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! AddAmenityTableViewCell
        
        let amenity = availableAmenities[indexPath.row]
       
        for (key, value) in amenitiesToSave {
            if key == amenity && value == true {
                cell.amenityrSwitch.on = true
            }
            
        }
        
        
        cell.amenityrSwitch.tag = indexPath.row
        cell.amenityrSwitch.addTarget(self, action: #selector(AddAmenityViewController.buttonClicked(_:)) , forControlEvents: UIControlEvents.TouchUpInside)
        
        print(amenity)
        cell.amenityLabel.text = amenity
        
        return cell
        
    }
    
    
    func buttonClicked(sender:UISwitch) {
        
        let buttonRow = sender.tag
        let amenity = availableAmenities[buttonRow]
        
        if sender.on {
            
            amenitiesToSave.updateValue(true, forKey: amenity)
            
           
        
           
        } else {
           amenitiesToSave.updateValue(false, forKey: amenity)
            
        }
        
        
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return availableAmenities.count
    }



}
