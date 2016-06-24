//
//  AddPropertyDetailsViewController.swift
//  APT2
//
//  Created by Aileen Taboy on 6/21/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class AddPropertyDetailsViewController: UIViewController {
    
    var apartmnetNameLabel: String?

    @IBAction func cancelButton(sender: AnyObject) {
        
      self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(apartmnetNameLabel)
        
//        if let apartMentName = apartmnetNameLabel {
//            self.performSegueWithIdentifier("editProperty", sender: apartMentName)
//            print("performing segue now ")
//        }

        // Do any additional setup after loading the view.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "editProperty" {
//            
//            print(sender)
//            
////            if let propertyName = sender {
////                
////                let vc = segue.destinationViewController as! EditPropertyDetailsTableViewController
////                vc.apartmentNameTextField.text = propertyName as? String
////            }
//            
//           
//            
//            
//        }
//    }
    

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
