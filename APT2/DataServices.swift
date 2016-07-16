//
//  DataServices.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import Foundation
import Firebase


let URL_BASE = "https://fiery-fire-2933.firebaseio.com/"


class DataService {

    
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "\(URL_BASE)")
    
    private var _REF_USERS = Firebase(url: "\(URL_BASE)/users")
    
    private var _REF_PROPERTIES  = Firebase(url: "\(URL_BASE)/properties")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    var REF_USERS: Firebase{
        return _REF_USERS
    }
    
    
    var REF_PROPERTIES: Firebase {
        
        return _REF_PROPERTIES
    }
    
    
    func createFirebaseUser(uid: String, user: Dictionary<String, String>){
        
        REF_USERS.childByAppendingPath(uid).setValue(user)
        
        
    }
    
    
    func createProperty(currentUser: AnyObject, propertyDetails: Dictionary<String, AnyObject>) {

        
        
      REF_USERS.childByAppendingPath("\(currentUser)/properties").childByAutoId().updateChildValues(propertyDetails)

        
        
        
    }
    
    
    
    
}



// REF_PROPERTIES.childByAutoId().setValue(propertyDictionary)

//REF_PROPERTIES.childByAppendingPath(propertyName).setValue(propertyDictionary)


//REF_PROPERTIES.childByAppendingPath(propertyName).updateChildValues(propertyDictionary)
//REF_PROPERTIES.childByAppendingPath(currentUser).setValue(propertyDictionary)

