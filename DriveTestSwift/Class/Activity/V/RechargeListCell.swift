//
//  RechargeListCell.swift
//  DriveTestSwift
//
//  Created by ios on 2017/7/10.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class RechargeListCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
  
    class func returnRechargeCell(_ tableView: UITableView) -> RechargeListCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: rechargeListCellID) as! RechargeListCell
        
        return cell
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
