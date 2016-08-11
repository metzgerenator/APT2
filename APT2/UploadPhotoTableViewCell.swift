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
    
    
    
    func configureCell(photoObject: Photos, img: UIImage?, CurrentIndexPath: NSIndexPath, tableView: UITableView) {
        
        captionLabel.text = photoObject.caption
        
        print("text is here \(captionLabel.text)")
        
        if let image = img {
            
            currentAptImage.image = image
            
//            let indexpath = NSIndexPath(forRow: CurrentIndexPath.row, inSection: 0)
//            tableView.reloadRowsAtIndexPaths([indexpath], withRowAnimation: .Automatic)
        
            
        }
        
    }
    
    
    

}
