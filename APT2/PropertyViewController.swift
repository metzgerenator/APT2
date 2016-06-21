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
    
    var currentUserID: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let userCheck =  NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) {
            
            currentUserID = userCheck as? String
 
        }
       
        
//        let propertyTrueQuery = DataService.ds.REF_USERS.queryOrderedByChild("properties")
        
        
        DataService.ds.REF_USERS.childByAppendingPath("\(currentUserID!)/properties").observeEventType(.Value, withBlock: { (snapshot)  in
            print(snapshot.value)
            
            self.propertyDictionary = []
            
            if let snaphots = snapshot.children.allObjects as? [FDataSnapshot] {
                
                for snap in snaphots {
                    
                    let key = snap.key
                    
                    print("snap: \(key)")
                    if let propDic = snap.value as? Dictionary<String, AnyObject> {
                        
                        
                        let apartment = Properties(Unitkey: key, dictionary: propDic)
                        self.propertyDictionary.append(apartment)
                    }
                    
                    
                }
            }
            
        })

        
        
//        DataService.ds.REF_USERS.observeEventType(.Value, withBlock: { (snapshot)  in
//            print(snapshot.value)
//           
//        })
////

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        cell?.textLabel?.text = "Testing"
 
        return cell!
        
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return 1
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
