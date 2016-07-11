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
    
    
   
    
    @IBOutlet var tableView: UITableView!
    
    
    
    
    @IBAction func cancelButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    @IBAction func unwindFromPhotoEdit(segue: UIStoryboardSegue){
        
        self.tableView.reloadData()
        
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
        
        //send index along
        
        self.performSegueWithIdentifier("imageEdit", sender: [indexPath.row])
        
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
                
                vc.currentIndex = sender as! Int
                vc.imageFromSegue = imageToSend
            } else if segue.identifier == "newImage" {
                
                vc.currentIndex == 0
                
            }
            
            vc.currentImageArrayFromSegue = self.currentImageArray
            
            

            
        }
        
        
        
    }


}
