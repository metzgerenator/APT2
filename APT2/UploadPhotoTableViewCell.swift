//
//  UploadPhotoTableViewCell.swift
//  APT2
//
//  Created by Michael Metzger  on 7/9/16.
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class UploadPhotoTableViewCell: UITableViewCell {

    @IBOutlet var currentAptImage: UIImageView!
    
    
    @IBOutlet var captionLabel: UILabel!
    
    

    @IBOutlet var isHomePageLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}