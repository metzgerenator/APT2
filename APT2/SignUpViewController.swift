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
        
        // old method 
        
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, faceBookError: NSError!) in

        
        if faceBookError != nil {
            print("Facebook login failed.  Error \(faceBookError)")
        } else if facebookResult.isCancelled {
            print("Facebook login was cancelled.")
        }
        else {
            
            
            let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
            
                            FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
            
                                NSUserDefaults.standardUserDefaults().setValue(user?.uid, forKey: KEY_UID)
                                self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                            }

            
            
        }
        
    }
    
    
    
    
    
        // new method
    
//
//        func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError?) {
//           
//            if let error = error {
//                 self.showErrorAlert("Could not login", msg: "Please check username and password\(error.localizedDescription)")
//                return
//            } else {
//                
//                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
//                
//                FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
//                    
//                    NSUserDefaults.standardUserDefaults().setValue(user?.uid, forKey: KEY_UID)
//                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
//                }
//            }
//        }
//        
        
        
        
        
        
    }
    
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //:MARK: signout method
       // try! FIRAuth.auth()!.signOut()

        
        if let userID = FIRAuth.auth()?.currentUser?.uid {
            
            // uid here NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID)
            
            print("UID = \(userID)")
        
            self.performSegueWithIdentifier("loggedIn", sender: nil)
            
        }
        
        

   

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func signUserUp(sender: UIButton!) {
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
            
            FIRAuth.auth()?.createUserWithEmail(email, password: pwd, completion: { (user, error) in
                
                if error == nil {
                    
                    
                    
                      NSUserDefaults.standardUserDefaults().setValue(user?.uid, forKey: KEY_UID)
                        self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                    
                    
                } else {
                    
                    self.showErrorAlert("Could not login", msg: "Please check username and password\(error!.localizedDescription)")
                }
                
                
            })
            
            
        }
        
        
    }
    
    
    
    @IBAction func attemptLogin(sender: UIButton!) {
        
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
            
            FIRAuth.auth()?.signInWithEmail(email, password: pwd, completion: { (user, error) in
                
                if error == nil {
                    
                    
                    
                    NSUserDefaults.standardUserDefaults().setValue(user?.uid, forKey: KEY_UID)
                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                    
                    
                } else {
                    
                    self.showErrorAlert("Could not login", msg: "Please check username and password\(error!.localizedDescription)")
                }
                
                
            })
            
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
