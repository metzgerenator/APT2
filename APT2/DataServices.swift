//
//  DataServices.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import Foundation
import Firebase


let URL_BASE = FIRDatabase.database().reference()

class DataService {

    
    static let ds = DataService()
    
    private var currentUser = FIRAuth.auth()?.currentUser?.uid
    
    private var _REF_BASE = URL_BASE
    
    private var _REF_USERS = URL_BASE.child("/users")

    private var _REF_PROPERTIES  = URL_BASE.child("/properties")
    
    var REF_BASE: FIRDatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS: FIRDatabaseReference{
        return _REF_USERS
    }
    
    
    var REF_PROPERTIES: FIRDatabaseReference {
        
        return _REF_PROPERTIES
    }
    
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>){
        
        REF_USERS.child(uid).setValue(user)
        
        
    }
    
    

    
    func createProperty(propertyDetails: Dictionary<String, AnyObject>) -> FIRDatabaseReference {

        let URLWithReference = REF_USERS.child("\(currentUser!)/properties").childByAutoId()
        
        URLWithReference.updateChildValues(propertyDetails)
        
        print("here is the url reference \(URLWithReference)")
        
        return URLWithReference
    }
    
    
    
    
    func updateProperty(url: FIRDatabaseReference, propertyDetails: Dictionary<String, AnyObject>) {
       
        print("url to be saved \(url)")
        
        url.updateChildValues(propertyDetails)
        
        
    }
    
    
    func removeProperty(url: String) {
        
       let firBaseUrl = FIRDatabase.database().referenceWithPath(url)
        
        firBaseUrl.removeValue()
        
    }
    
    
    
    
}



// REF_PROPERTIES.childByAutoId().setValue(propertyDictionary)

//REF_PROPERTIES.childByAppendingPath(propertyName).setValue(propertyDictionary)


//REF_PROPERTIES.childByAppendingPath(propertyName).updateChildValues(propertyDictionary)
//REF_PROPERTIES.childByAppendingPath(currentUser).setValue(propertyDictionary)

