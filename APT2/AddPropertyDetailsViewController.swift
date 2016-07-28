//
//  AddPropertyDetailsViewController.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase



class AddPropertyDetailsViewController: UIViewController {
    
    var currentUserID: AnyObject!
    var urlPath: FIRDatabaseReference!

    
    @IBOutlet var apartMentPhoto: UIImageView!
    
    
    var photoForApartment: UIImage?
    
    
    
    var apartmnetNameLabel: String?
    
    
    
    @IBAction func cameraButton(sender: AnyObject) {
        self.performSegueWithIdentifier("aptPhotos", sender: nil)
        
    }
    
    

    @IBAction func cancelButton(sender: AnyObject) {
        
    
    
        self.dismissViewControllerAnimated(true) { 
            if let url = self.urlPath {
                
                //DataService.ds.removeProperty(url)
                
                
            }
        }
        
      //self.dismissViewControllerAnimated(true, completion: nil)
        
    
        
    }
    
    @IBAction func saveButton(sender: AnyObject) {
         let vc = self.childViewControllers[0] as! EditPropertyDetailsTableViewController
        
        
        let ApartmentName = vc.apartmentNameTextField.text
        
        let adddress = vc.addressNameTextField.text
        
        let rent = vc.priceLabel.text
        
        let frequency = vc.rentFrequency.text
        
        
        let bedrooms = vc.numberBedroomLbel.text
        
        let bathrooms = vc.numberBathroomsLabel.text
                
        
        let amentyDictionary = vc.currentAmenities
        
        
        //save to firebase 
        
        
          let propertyDic: Dictionary = ["Name" : ApartmentName!, "Address" : adddress!, "Rent" :  ["Price" : rent!, "Frequency" : frequency!], "Bedrooms" : bedrooms!, "Bathrooms" : bathrooms!, "Amenities" : amentyDictionary]
        
        print("here is propertydic \(propertyDic)")
        
            DataService.ds.updateProperty(urlPath, propertyDetails: propertyDic)
            
        
        
    
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        
        if let currentPhoto = photoForApartment {
            apartMentPhoto.image = currentPhoto
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        
       
        
    
        
        
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
    

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "aptPhotos" {
            
            let vc = segue.destinationViewController as! uploadPhotoTableViewController
            
            if let url = self.urlPath {
                //MARK: update URL type
                //vc.currentURl = url
            }
            
            
            
            
            
        }
       
    }
 
    
    
    
    //MARK: Table view methods
    
    
    


}
