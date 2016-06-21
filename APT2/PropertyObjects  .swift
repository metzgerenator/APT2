//
//  PropertyObjects  .swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import Foundation

class Properties {
    
    private var _key: String!
    private var _name: String?
    private var _bedrooms: Int?
    private var _petsAllowed: Bool?
    private var _washerDyer: Bool?
    private var _amenities: [String]?
    
    
    
    var key: String {
        return _key
    }
    
    var name: String? {
        return _name
    }
    
    
    var bedrooms: Int? {
        return _bedrooms
    }
    
    var petsAllowed: Bool? {
        return _petsAllowed
    }
    
    
    var washerDyer: Bool? {
        return _washerDyer
    }
    
    var amenities: [String]? {
        return _amenities
    }
    
    
    
    init(key: String, name: String?) {
        self._key = key
        
        self._name = name
    }
    
    
    init(Unitkey: String, dictionary: Dictionary<String, AnyObject>) {
        
        self._key = Unitkey
        
        if let names = dictionary["Name"] as? String {
            self._name = names
        }
        
    }
    
    
    
    
    
    
}














