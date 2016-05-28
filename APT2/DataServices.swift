//
//  DataServices.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import Foundation
import Firebase

class DataService {
    
    static let ds = DataService()
    
    private var _REF_BASE = Firebase(url: "https://fiery-fire-2933.firebaseio.com/")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    
}

