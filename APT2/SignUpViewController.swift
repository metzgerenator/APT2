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


class SignUpViewController: UIViewController {
    
    
    @IBAction func fbBtnPressed(sender: UIButton!) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, faceBookError: NSError!) in
            
            if faceBookError != nil {
                print("Facebook login failed.  Error \(faceBookError)")
            }else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Successfully logged in with facebook. \(accessToken)")
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
