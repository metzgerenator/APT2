//
//  AddPropertyDetailsViewController.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class AddPropertyDetailsViewController: UIViewController {
    
    var currentUserID: AnyObject?

    
    var apartmnetNameLabel: String?

    @IBAction func cancelButton(sender: AnyObject) {
        
      self.dismissViewControllerAnimated(true, completion: nil)
        
    
        
    }
    
    @IBAction func saveButton(sender: AnyObject) {
         let vc = self.childViewControllers[0] as! EditPropertyDetailsTableViewController
        
        let ApartmentName = vc.apartmentNameTextField.text
        
        let adddress = vc.addressNameTextField.text
        
        let rent = vc.priceLabel.text
        
        let bedrooms = vc.numberBedroomLbel.text
        
        let bathrooms = vc.numberBathroomsLabel.text
        
        print("apartment name: \(ApartmentName), address: \(adddress), rent: \(rent), bedrooms: \(bedrooms), bathrooms: \(bathrooms)")
        
        //save to firebase 
        
        let propertyDic = ["Name" : ApartmentName!, "Address" : adddress!, "Rent" :  rent!, "Bedrooms" : bedrooms!, "Bathrooms" : bathrooms!]
        
        DataService.ds.createProperty(currentUserID!, propertyDetails: propertyDic)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userCheck =  NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) {
            
            currentUserID = userCheck
            
            
        }
        
        if let apartmentName = apartmnetNameLabel {
            
            print(apartmentName)
            
           let vc = self.childViewControllers[0] as! EditPropertyDetailsTableViewController
            vc.apartmentNameTextField.text = apartmentName
        
            
        }
        
        
        print(self.childViewControllers[0])
        

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
    
    
    
    //MARK: Table view methods
    
    
    


}
