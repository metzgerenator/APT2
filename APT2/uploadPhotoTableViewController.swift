//
//  uploadPhotoTableViewController.swift
//  APT2
//
//  Created by Michael Metzger  on 7/9/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class uploadPhotoTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet var tableView: UITableView!
    
    
    
    
    @IBAction func cancelButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    @IBAction func upLoadButton(sender: AnyObject) {
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    //MARK: tableview methods 
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell")
        
        return cell!
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
