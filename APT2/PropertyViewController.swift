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
    
    var currentUserID: String!
    // string for master branch 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
       
        currentUserID =  FIRAuth.auth()?.currentUser?.uid
        
        
        DataService.ds.REF_USERS.child("\(currentUserID!)/properties").observeEventType(.Value, withBlock: { (snapshot)  in
            print(snapshot.value)
            
            self.propertyDictionary = []
            
            if let snaphots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snaphots {
                    
                    let key = snap.key
                    
                    print("snap: \(key)")
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
 
        return cell!
        
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return propertyDictionary.count
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
