//
//  AddAmenityViewController.swift
//  APT2
//
//  Created by Michael Metzger  on 6/26/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class AddAmenityViewController: UIViewController {

    @IBAction func cancelButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        
        self.performSegueWithIdentifier("amenity", sender: amenityTextField.text)
        
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
            vc.newAmenity = sender as? String
            
            
            
        }
    }


}
