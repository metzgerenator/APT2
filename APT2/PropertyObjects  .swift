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
        
        if let name = dictionary["Name"] as? String {
            self._name = name
        }
        
        var photoArray = [AnyObject]()
        
        if let photoLinks = dictionary["photos"] as? Dictionary<String, AnyObject> {
            
            for (key, value) in photoLinks {
                
                
                let photoURLDict = value["picture_info"] as! Dictionary<String, AnyObject>
                
                let photoUrl = photoURLDict["picture_url"] as! String
                let photoCaption = photoURLDict["caption"] as! String
                
                let imageDictionary = ["caption" : photoCaption, "picture_url" : photoUrl]
                
                photoArray.append(imageDictionary)
                
                
                
            }
            
            self._imageDictionary = photoArray
            
            
            
        }
        
    }
    
    
 
    
    
    
    
    
}



class Photos {
    
    private var _photoUrl: String!
    private var _key: String!
    private var _caption: String?
    
    var photoUrl: String {
        
        return _photoUrl
    }
    
    var key: String {
        return _key
    }
    
    
    var caption: String? {
        
        return _caption
        
        
    }
    
    
    
    
    init (dictionary: Dictionary<String, AnyObject>) {
        
        _key = dictionary["key"] as! String
        
        let pictureInfo = dictionary["picture_info"] as! Dictionary<String, AnyObject>
        
        
        _photoUrl = pictureInfo["picture_url"] as! String
        
        if let currentCaption = pictureInfo["caption"]{
            
            _caption = currentCaption as? String
            
        }
        
        
        print("key: \(key), photourl \(photoUrl), caption \(caption)")
        
        
        
    }
    
    
    
    

}













