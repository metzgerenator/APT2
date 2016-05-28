//
//  SignUpViewController.swift
//  APT2
//
//  Created by Michael Metzger  on 5/15/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase


class SignUpViewController: UIViewController {
    
    let facebookLogin = FBSDKLoginManager()
    
    @IBAction func fbBtnPressed(sender: UIButton!) {
        
        
        
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, faceBookError: NSError!) in
            
            if faceBookError != nil {
                print("Facebook login failed.  Error \(faceBookError)")
            } else if facebookResult.isCancelled {
                print("Facebook login was cancelled.")
            }
            else {
                
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
            
                
                DataService.ds.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { (error, authData) in
                    
                    if error != nil {
                        
                        
                        print("Login failed. \(error)")
                    } else {
                        
                        //print("token = \(accessToken)")
                        
                        print("Logged in! \(authData)")
                        NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                        self.performSegueWithIdentifier("success", sender: nil)
                        
                    }
                    
                    
                })
                
                
                
            }
            
        }
        
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
   

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
