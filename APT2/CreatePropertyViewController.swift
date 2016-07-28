//
//  CreatePropertyViewController.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase


class CreatePropertyViewController: UIViewController {
    
    

    @IBOutlet weak var newPropertyName: UITextField!
    @IBAction func saveProperty(sender: AnyObject) {
        
        
        if newPropertyName.text?.characters.count > 0 {
            // save to parse
          
                let propertyDictionary: Dictionary<String, AnyObject> = ["Name" : newPropertyName.text!]
                
                 let urlPath =  DataService.ds.createProperty(propertyDictionary)
            
            
                self.performSegueWithIdentifier("propertyDetail", sender: urlPath)

            
            
           
            
            
            
            
        }
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "propertyDetail" {
            
            
            
            let vc = segue.destinationViewController as! AddPropertyDetailsViewController
            vc.apartmnetNameLabel = newPropertyName.text
            
            vc.urlPath = sender as? String
            
            
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
      
        
       
            
        
      
        
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
