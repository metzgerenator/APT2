//
//  EditPhotoViewController.swift
//  APT2
//
//  Created by Michael Metzger  on 7/9/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class EditPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var currentImageArrayFromSegue = [AptPhotoType]()

    
    var currentIndex:Int!
    
    var imageFromSegue: AptPhotoType?
    
    
    
    @IBOutlet var homePageSwitch: UISwitch!
    
    
    @IBOutlet var captionTextField: UITextField!
    
    
    @IBAction func saveButton(sender: AnyObject) {
        
    
        // update current data and append to array
        
        let itemTosend = AptPhotoType(aptImage: currentImage.image, aptCaption: captionTextField.text, homePage: homePageSwitch.on)
       
        
       //currentImageArrayFromSegue.removeAtIndex(self.currentIndex)
        
        self.currentImageArrayFromSegue.append(itemTosend)
        
        self.performSegueWithIdentifier("imageunwind", sender: nil)
        
        
        
        
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