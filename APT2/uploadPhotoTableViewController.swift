//
//  uploadPhotoTableViewController.swift
//  APT2
//
//  Created by Michael Metzger  on 7/9/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase


class uploadPhotoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    
    var currentImageArray = [Photos]()
    
    var currentImageObject: AptPhotoType?
    
    var currentURl: FIRDatabaseReference!
    
   
    
    @IBOutlet var tableView: UITableView!
    
    
    
    
    @IBAction func cancelButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    

    @IBAction func unwindFromPhotoEdit(segue: UIStoryboardSegue){
        
        //addupdate url function
        
        
        self.currentImageArray.removeAll()
        
        self.tableView.reloadData()
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("here is the url \(currentURl)")
        
        currentURl.child("/photos").observeEventType(.Value, withBlock: { (snapshot)  in
            
            
            if let snaphots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snaphots {
                    
                    
                    
                    if let photoDic = snap.value as? Dictionary<String, AnyObject> {
                        
                        print("here is the photodic \(photoDic)")
                        
                        let photo = Photos(dictionary: photoDic)
                        
                        self.currentImageArray.append(photo)
            
                        self.tableView.reloadData()
                    }
                    
                    
                }
            }
            
        })

    }

    
    //MARK: tablevieaw methods
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentImageArray.count
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let currentImage = currentImageArray[indexPath.row]
        
        
        
        //send index along
        
        self.performSegueWithIdentifier("imageEdit", sender: [indexPath.row])
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UploadPhotoTableViewCell
        
        cell.currentAptImage.image = nil
        
        let currentObject = self.currentImageArray[indexPath.row]
        
        var img: UIImage?
        
        
        if let url = currentObject.photoUrl {
           
            img = PropertyViewController.imageCache.objectForKey(url) as? UIImage
           
             print("image is here: \(img)")
        }
        cell.configureCell(currentObject, img: img, CurrentIndexPath: indexPath, tableView: tableView)
        
     
        return cell
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! EditPhotoViewController
        
        vc.currentURL = currentURl

        if segue.identifier == "imageEdit" {
   
        
    }

    }
}
