//
//  AddAmenityTableViewCell.swift
//  APT2
//
//  Copyright © 2016 Michael Metzger . All rights reserved.
//

import UIKit

class AddAmenityTableViewCell: UITableViewCell {

    @IBOutlet weak var amenityLabel: UILabel!
    
    
    @IBOutlet weak var amenityrSwitch: UISwitch!
    

    @IBAction func amenitySwitchAction(sender: UIButton) {
        

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
