//
//  EditPhotoViewController.swift
//  APT2
//
//  Created by Michael Metzger  on 7/9/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class EditPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageFromSegue: AptPhotoType?
    
    var ArrayFromSeque = [AptPhotoType]()
    
    
    @IBOutlet var homePageSwitch: UISwitch!
    
    
    @IBOutlet var captionTextField: UITextField!
    
    
    @IBAction func saveButton(sender: AnyObject) {
        
        // perfom reverse segue 
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
