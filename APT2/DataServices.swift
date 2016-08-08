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
    
     var currentUser = FIRAuth.auth()?.currentUser?.uid
    
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
       
        
        url.updateChildValues(propertyDetails)
        
        
    }
    
    
    func addPhotos(url: FIRDatabaseReference, propertyDetails: Dictionary<String, AnyObject>) {
        
       // create url with base ID
        let key = url.key
        
        
        // REF_USERS.child("\(currentUser!)/properties").childByAutoId()
        let postURL = REF_USERS.child("\(currentUser!)/photos").childByAutoId()
        
        let childUpdatesPhotos = ["key" : key, "picture_info" : propertyDetails]
        
        postURL.updateChildValues(childUpdatesPhotos as [NSObject : AnyObject])
        
        
       let newURL =  url.child("photos").childByAutoId()
        print("url : \(newURL)")
        
        newURL.updateChildValues(childUpdatesPhotos as [NSObject : AnyObject])
        
        
        
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

