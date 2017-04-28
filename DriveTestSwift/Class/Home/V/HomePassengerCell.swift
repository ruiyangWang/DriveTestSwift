//
//  HomePassengerCell.swift
//  DriveTestSwift
//
//  Created by ios on 2017/3/9.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class HomePassengerCell: UITableViewCell {

    var pasenger: PassengerModel? {
        didSet {
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
