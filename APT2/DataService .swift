//
//  DataService .swift
//  APT2
//
//  Created by Michael Metzger  on 5/15/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = "https://fiery-fire-2933.firebaseIO.com"

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "\(URL_BASE)")
    private var _REF_USERS = Firebase(url: "\(URL_BASE)/users")
    
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    var REF_USERS: Firebase {
        return _REF_USERS
    }
    
    //Firebase will create the UID the path does not exist
    func createFirebaseUser(uid: String, user: Dictionary<String , String>) {
        REF_USERS.childByAppendingPath(uid).setValue(user)
    }
}


 