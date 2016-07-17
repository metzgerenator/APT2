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

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func fbBtnPressed(sender: UIButton!) {
    
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, faceBookError: NSError!) in
            
            if faceBookError != nil {
                print("Facebook login failed.  Error \(faceBookError)")
            } else if facebookResult.isCancelled {
                print("Facebook login was cancelled.")
            }
            else {
                
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
            
                
                
                DataService.ds.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in
                    
                    if error != nil {
                        
                        
                        print("Login failed. \(error)")
                    } else {
                        
                        let user  = ["provider": authData.provider!]
                        
                        DataService.ds.createFirebaseUser(authData.uid, user: user)
                        
                        print("Logged in! \(authData)")
                        NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                        self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                        
                    }
                    
                    
                })
                
                
                
            }
            
        }
        
        
        
    }
    
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
            
            print(NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID))
            self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
        }
   

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func attemptLogin(sender: UIButton!) {
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
            
            DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { (error, authData) in
                
                if error != nil {
                    print("\(error) error code: \(error.code)")
                    
                    
                    if error.code == STATUS_ACCOUNT_NONEXIST {
                        
                        DataService.ds.REF_BASE.createUser(email, password: pwd, withValueCompletionBlock: { (error, result) in
                            
                            if error != nil {
                                self.showErrorAlert("Could not create account", msg: "problem creating Account")
                                
                            }else {
                                
                                NSUserDefaults.standardUserDefaults().setValue(result[KEY_UID], forKey: KEY_UID)
                                
                                
                              
                                DataService.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { err, data in
                                    
                                    
                                    let user  = ["provider": data.provider!]
                                    
                                    DataService.ds.createFirebaseUser(data.uid, user: user)
                                    
                                    
                                })
                                
                                self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                                
                            }
                            
                            
                        })
                        
                        
                    } else {
                        self.showErrorAlert("Could not login", msg: "Please check username and password")
                    }
                    
                }
                
                else {
                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                }
                
                
            })
            
            
            
        } else {
            showErrorAlert("Check Email and Password", msg: "Email and password is required")
        }
        
        
        
    }
    
    
    func showErrorAlert(title: String, msg: String) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
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
