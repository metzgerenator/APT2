//
//  EditPhotoViewController.swift
//  APT2
//
//  Created by Michael Metzger  on 7/9/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class EditPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var currentURL: FIRDatabaseReference!
    
    let storage = FIRStorage.storage()

    
    var currentImageArrayFromSegue = [AptPhotoType]()
    
    
    var currentIndex:Int!
    
    var imageFromSegue: AptPhotoType?
    
    
    @IBOutlet var loadIndicator: UIActivityIndicatorView!
    
    @IBOutlet var homePageSwitch: UISwitch!
    
    
    @IBOutlet var captionTextField: UITextField!
    
    
    @IBAction func saveButton(sender: AnyObject) {
        
    
        // update current data and append to array
        
        let itemTosend = AptPhotoType(aptImage: currentImage.image, aptCaption: captionTextField.text, homePage: homePageSwitch.on)
       
        
       //currentImageArrayFromSegue.removeAtIndex(self.currentIndex)
        
        self.currentImageArrayFromSegue.append(itemTosend)
        
        
        // save file to Storage bucket

        let storageRef = storage.reference()
        
       
        
        
        
        if let imageSelected = currentImage.image {
            loadIndicator.hidden = false
            loadIndicator.startAnimating()
            
            //let data  = UIImagePNGRepresentation(imageSelected)
            let imageData = UIImageJPEGRepresentation(imageSelected, 0.2)
            //create a reference with random number 
            
             let randomNumber = Int(arc4random_uniform(20000) + 1)
        
            
            let imgURL = storageRef.child("properties/\(randomNumber).jpg")
            
            let imageForCache = UIImage(data: imageData!)
            
            PropertyViewController.imageCache.setObject(imageForCache!, forKey: imgURL)
            
            imgURL.putData(imageData!, metadata: nil, completion: { (data, error) in
                if error == nil {
                    
                    let caption = self.captionTextField.text
                    
                    let propertyDic = ["picture_url" : "\(imgURL)", "caption" : caption!]
                    
                    DataService.ds.addPhotos(self.currentURL, propertyDetails: propertyDic)
                    
                    print("no error ")
                    
                    self.performSegueWithIdentifier("imageunwind", sender: nil)
                    
                } else {
                    
                    //add uialert window
                    self.showErrorAlert("Oh oh!", msg: "something went wrong, try saving again")
                    
                    print(error?.description)
                }
                
                
            })
            
            loadIndicator.hidden = true
            
        
            
        }
        
     
        
        
        
        
        
        
        
    }
    
    
    
    func showErrorAlert(title: String, msg: String) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancelButton(sender: AnyObject) {
        
        
        
    }
    
    

    @IBOutlet var currentImage: UIImageView!
    
    
    @IBAction func libraryButton(sender: AnyObject) {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = false
        
        picker.sourceType = .PhotoLibrary
        picker.modalPresentationStyle = .FullScreen
        
        presentViewController(picker, animated: true, completion: nil)
        
        
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            self.currentImage.image = image as? UIImage
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        if let currenAptImageData = imageFromSegue {
            
            currentImage.image = currenAptImageData.aptImage
            captionTextField.text = currenAptImageData.aptCaption
            homePageSwitch.on = currenAptImageData.homePage
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadIndicator.hidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "imageunwind" {
            
            let vc = segue.destinationViewController as! uploadPhotoTableViewController
          
            
            // send new array 
            vc.currentImageArray = self.currentImageArrayFromSegue
            
            
        }
        
        
       
    }
 

}
