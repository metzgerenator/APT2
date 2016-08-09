//
//  PropertyViewController.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class PropertyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBAction func tableReload(sender: AnyObject) {
        
        self.tableView.reloadData()
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    var propertyDictionary = [Properties]()
    
    var photoDictionary = [String : AnyObject]()
    
    static var imageCache = NSCache()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
       
        let currentUSer =  FIRAuth.auth()?.currentUser?.uid
        
        
        
        DataService.ds.REF_USERS.child("\(currentUSer!)/photos").observeEventType(.Value, withBlock: { (snapshot)  in
            
            self.photoDictionary = [:]
            
            if let snaphots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snaphots {
                    
                    
                    
                    if let photoDic = snap.value as? Dictionary<String, AnyObject> {
                        
                        let photo = Photos(dictionary: photoDic)
                        self.photoDictionary.updateValue(photo.photoUrl, forKey: photo.key)
                        

                        //launch image catch
                        
                        //not sure if we want to reload tableview
                       // self.tableView.reloadData()
                        
                        self.downloadTocache(photo.key, url: photo.photoUrl)
                        
                    }
                    
                    
                }
            }
            
        })
//
        
        
        
        
        
        
        DataService.ds.REF_USERS.child("\(currentUSer!)/properties").observeEventType(.Value, withBlock: { (snapshot)  in
            //print(snapshot.value)
            
            self.propertyDictionary = []
            
            if let snaphots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snaphots {
                    
                    let key = snap.key
                    
                    
                    if let propDic = snap.value as? Dictionary<String, AnyObject> {
                        
                        
                        let apartment = Properties(Unitkey: key, dictionary: propDic)
                        self.propertyDictionary.append(apartment)
                        
                        
                        
                        self.tableView.reloadData()
                    }
                    
                    
                }
            }
            
        })

        


    }
    
    
    
    
    func downloadTocache(key: String, url: String) {
        
        // check if image is already cached 
        
        if PropertyViewController.imageCache.objectForKey(url) == nil {
            print("this is nil and should be loaded")
            
        
        
        let httpsReference = FIRStorage.storage().referenceForURL(url)
        
        
        httpsReference.dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
            
            if (error != nil) {
                print("error occured \(error.debugDescription)")
                
                
            } else {
                
                print("it works")
                let image = UIImage(data: data!)
                
                // add image to cache
                PropertyViewController.imageCache.setObject(image!, forKey: url)
                
                print("success image \(image)")
                
            }
        }
    }
        
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table view methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let currentUnit = propertyDictionary[indexPath.row]
        
       if let cell = tableView.dequeueReusableCellWithIdentifier("cell") as? PropertyTableViewCell {
        
        cell.propertyImage.image = nil
            
            // cancel api call 
        var img: UIImage?
        
        if let url = currentUnit.imageLink {
            print("image is here: \(img)")
            
            img = PropertyViewController.imageCache.objectForKey(url) as? UIImage
            
        }
        
        cell.configureCell(currentUnit, img: img)
        
        
        
            return cell
            
        }
        
        
      return PropertyTableViewCell()
        
    }
    
    

    
    
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return propertyDictionary.count
    }
    
    
    
    @IBAction func logOutButton(sender: AnyObject) {
        
        do {
           try FIRAuth.auth()!.signOut()
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        } catch let error {
            
            print("there was an error \(error)")
            
        }
        
        
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
