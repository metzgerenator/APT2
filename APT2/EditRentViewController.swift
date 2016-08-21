//
//  EditRentViewController.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class EditRentViewController: UIViewController {
    
    
    @IBOutlet weak var priceTextLabel: UITextField!
    
    
    
    @IBOutlet weak var frequencyTextLabel: UITextField!
    

    @IBAction func cancelButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "rentprice" {
            
            let vc = segue.destinationViewController as! EditPropertyDetailsTableViewController
            
            vc.priceLabel.text = priceTextLabel.text
            vc.rentFrequency.text = frequencyTextLabel.text
            
        }
        
    }


}
