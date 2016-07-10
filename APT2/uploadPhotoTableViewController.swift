//
//  uploadPhotoTableViewController.swift
//  APT2
//
//  Created by Michael Metzger  on 7/9/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class uploadPhotoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    
    var currentImageArray = [AptPhotoType]()
    
    var currentImageObject: AptPhotoType?
    
    
    @IBAction func plusButton(sender: AnyObject) {
        
        self.performSegueWithIdentifier("imageEdit", sender: self)
        
        
    }
    
    @IBOutlet var tableView: UITableView!
    
    
    
    
    @IBAction func cancelButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    //MARK: tableview methods 
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentImageArray.count
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let currentImage = currentImageArray[indexPath.row]
        
       currentImageObject = currentImage
        
        self.performSegueWithIdentifier("imageEdit", sender: nil)
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UploadPhotoTableViewCell
        
        let currentObject = self.currentImageArray[indexPath.row]
        
        cell.currentAptImage.image = currentObject.aptImage
        cell.captionLabel.text = currentObject.aptCaption
        cell.isHomePageLabel.text = "\(currentObject.homePage)"
        
     
        
        return cell
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "imageEdit" {
            
            let vc = segue.destinationViewController as! EditPhotoViewController
            
            if let imageToSend = self.currentImageObject {
                vc.imageFromSegue = imageToSend
            }
            
            vc.ArrayFromSeque = self.currentImageArray
            

            
        }
        
        
        
    }


}
