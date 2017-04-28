//
//  PassengerModel.swift
//  DriveTestSwift
//
//  Created by ios on 2017/4/12.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class PassengerModel: NSObject {

    var brandId : String?
    var carsId : String?
    
    init(dict: [String : AnyObject]) {
        super.init()
        
        brandId = dict["brindId"] as? String
        
    }
    
}
