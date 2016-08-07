//
//  PropertyViewController.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class PropertyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var propertyDictionary = [Properties]()
    
    var photoDictionary = [Photos]()
    var loadedPhotos = [UIImage]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
       
        let currentUSer =  FIRAuth.auth()?.currentUser?.uid
        
        
        DataService.ds.REF_USERS.child("\(currentUSer!)/photos").observeEventType(.Value, withBlock: { (snapshot)  in
            //print(snapshot.value)
            
            self.photoDictionary = []
            
            if let snaphots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snaphots {
                    
                   // let key = snap.key
                    
                    
                    if let photoDic = snap.value as? Dictionary<String, AnyObject> {
                        
                        
                        let photo = Photos(dictionary: photoDic)
                        
                        self.photoDictionary.append(photo)
                        
                        
                    }
                    
                    
                    
                }
            }
            
            //call photo load here
            
            self.imageLoader2(self.photoDictionary, completion: { (imageDictionary) in
                
                self.loadedPhotos = imageDictionary as Array<UIImage>
                
                print("loaded images = \(self.loadedPhotos)")
            })
            
        })
        
        
        
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table view methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        let unitName = propertyDictionary[indexPath.row]
        
        print(unitName.name)
        
        cell?.textLabel?.text = unitName.name
        
        //configure demo image here 
        
//        if let imageDictionary = unitName.imageDictionary {
//            
//            imageLoader(imageDictionary, completion: { (Image) in
//            
//                cell?.imageView?.image = Image as UIImage
//                
//                //tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
//               // tableView.reloadData()
//            
//        
//          })
//            
//            
//        }
        
       
        
        
 
        return cell!
        
    }
    
    
    func imageLoader2(photoObjects: [Photos], completion: (imageDictionary: [UIImage]) -> Void) {
        
        var imagestoReturn: Array<UIImage> = []
        
        for item in photoObjects {
            
            let httpsReference = FIRStorage.storage().referenceForURL(item.photoUrl)
            
            httpsReference.dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
                if (error != nil) {
                    print("error occured \(error.debugDescription)")
                    
                    let image = UIImage(named: "dilbert.png")!
                    imagestoReturn.append(image)
                    
                    
                    
                } else {
                    
                    print("it works")
                    let image = UIImage(data: data!)
                    
                    print("success image \(image)")
                    imagestoReturn.append(image!)
                    
                }
            }
            
            
        }
        print("loaded photos here\(self.loadedPhotos)")
        completion(imageDictionary: imagestoReturn)
   
        
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
