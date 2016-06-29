//
//  PhotoLibraryViewController.swift
//  APT2
//
//  Created by Michael Metzger  on 6/29/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class PhotoLibraryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imageToPass: UIImage?
    
    var loadLibrary = true
    
    
    @IBAction func CancelButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       
        
        if (loadLibrary) {
            
        
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        
        picker.sourceType = .PhotoLibrary
        
        // add completeion and bool to let the user go back if they hit cancel
        
        presentViewController(picker, animated: true, completion: nil)
            
            
        }
        
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
             imageToPass = image as? UIImage
            loadLibrary = false
            
            dismissViewControllerAnimated(true, completion: { 
                self.performSegueWithIdentifier("photoSave", sender: nil)
            })
            
            
            
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "photoSave" {
            
            let vc = segue.destinationViewController as! SaveFileViewController
            
            if let currentImage = imageToPass {
                
                print("currentImage \(currentImage)")
                
                vc.imageFromPicker = currentImage
                
                loadLibrary = true
            }
            
            
            
        }
      
    }
 

}
