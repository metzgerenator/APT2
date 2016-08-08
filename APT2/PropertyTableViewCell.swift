//
//  PropertyTableViewCell.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit
import Firebase

class PropertyTableViewCell: UITableViewCell {

    @IBOutlet weak var propertyNameLabel: UILabel!
    
    
    @IBOutlet weak var propertyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func configureCell(property: Properties, img: UIImage?) {
        
        propertyNameLabel.text = property.name!
        
        print("setting property name\(property.name), image url = \(property.imageLink)")
        
        if property.imageLink != nil {
            
            if img != nil {
                print("calling functiontime")
                
              self.propertyImage.image = img
                
            } else {
                
                
                let httpsReference = FIRStorage.storage().referenceForURL(property.imageLink!)

                
                httpsReference.dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
                    
                    if (error != nil) {
                        print("error occured \(error.debugDescription)")
                        
                        
                    } else {
                        
                        print("it works")
                        let image = UIImage(data: data!)
                        self.propertyImage.image = image
                        
                        // add image to cache
                        PropertyViewController.imageCache.setObject(image!, forKey: property.imageLink!)
                        
                        print("success image \(image)")
                        
                    }
                }
                
            }
            
            
            
            
        } else {
            
            self.propertyImage.hidden = true
        }
        
    }
    

}
