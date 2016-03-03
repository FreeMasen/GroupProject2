//
//  EditMenuItemCellTableViewCell.swift
//  GroupProject2
//
//  Created by Casey on 3/1/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import UIKit

class EditMenuItemCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addPhotoButton: UIButton!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func takePhoto(sender: AnyObject) {
        
    }
}
