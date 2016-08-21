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
        
        if let image = img {
            propertyImage.image = image
            
        }
        
        
            
            
       // print("setting property name\(property.name), image url = \(property.imageLink)")

        
        }
        

        
    
    

}
