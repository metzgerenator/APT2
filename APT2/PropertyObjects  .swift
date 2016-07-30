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
    private var _amenities: [String]?
    private var _imageLink: String?
    private var _imageDictionary: Array<AnyObject>?
    
    
    
    var key: String {
        return _key
    }
    
    var name: String? {
        return _name
    }
    
    
    var bedrooms: Int? {
        return _bedrooms
    }
    
    var imageLink: String? {
        
        return _imageLink
        
    }
    
    var imageDictionary: Array<AnyObject>? {
        
        return _imageDictionary
    }
    

    
 
    
    
    
    init(key: String, name: String?, imageDictionary: Array<String>) {
        self._key = key
        
        self._name = name
        
        self._imageDictionary = imageDictionary
        
    }
    
    
    init(Unitkey: String, dictionary: Dictionary<String, AnyObject>) {
        
        self._key = Unitkey
        
        if let names = dictionary["Name"] as? String {
            self._name = names
        }
        
        if let photoLinks = dictionary["photos"] as? Dictionary<String, AnyObject> {
            
            for (key, value) in photoLinks {
                
                //convert to dictionary first ? 
                
                //print("key = \(key),   value = \(value)")
                
                let photoURLDict = value["picture_info"] as! Dictionary<String, AnyObject>
                
                let photoUrl = photoURLDict["picture_url"] as! String
                let photoCaption = photoURLDict["caption"] as! String
                
                let imageDictionary = ["caption" : photoCaption, "picture_url" : photoUrl]
                
                self._imageDictionary?.append(imageDictionary)
                
                
                
            }
            
            
            
        }
        
    }
    
    
    
    
    
    
}














