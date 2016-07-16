//
//  CreatePropertyViewController.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class CreatePropertyViewController: UIViewController {
    
    var currentUser: String?
    var urlPath: String?
    

    @IBOutlet weak var newPropertyName: UITextField!
    @IBAction func saveProperty(sender: AnyObject) {
        
        
        if newPropertyName.text?.characters.count > 0 {
            // save to parse
          
            if let user = currentUser {
                let propertyDictionary: Dictionary<String, AnyObject> = ["Name" : newPropertyName.text!]
                
                 self.urlPath =  DataService.ds.createProperty(user, propertyDetails: propertyDictionary)
                
                self.performSegueWithIdentifier("propertyDetail", sender: newPropertyName.text)

            }
            
           
            
            
            
            
        }
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "propertyDetail" {
            
            
            
            let vc = segue.destinationViewController as! AddPropertyDetailsViewController
            vc.apartmnetNameLabel = sender as? String
            
            vc.urlPath = self.urlPath
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        if let userCheck =  NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) {
            
            currentUser = userCheck as? String
            
            
            
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
