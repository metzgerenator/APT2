//
//  SaveFileViewController.swift
//  APT2
//
//  Created by Michael Metzger  on 6/29/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class SaveFileViewController: UIViewController {

    @IBAction func shareButton(sender: AnyObject) {
    }
    var imageFromPicker: UIImage?
    
    
    @IBOutlet var imageToSave: UIImageView!
    
    
    @IBOutlet var captionTextField: UITextField!
    
    @IBOutlet var makeCoverImageSwitch: UISwitch!
    @IBAction func makeCoverImageSwitchAction(sender: AnyObject) {

        
    }
    
    
    @IBAction func submitButton(sender: AnyObject) {
        
        /// save to parse and dismiss view 
        let switchViewController = self.storyboard?.instantiateViewControllerWithIdentifier("property") as! AddPropertyDetailsViewController
        switchViewController.photoForApartment = imageFromPicker
        
        
        self.navigationController?.pushViewController(switchViewController, animated: true)
        
        print(switchViewController)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if let image = imageFromPicker {
            imageToSave.image = image
        }
        
        
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
