//
//  HomeModel.swift
//  DriveTestSwift
//
//  Created by ios on 2017/7/12.
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

class CustomerModel: NSObject {
    
    var modelId : String?
    var customerName : String?
    init(dict: [String : AnyObject]) {
        super.init()
        
        modelId = dict["modelId"] as? String
        customerName = dict["customerName"] as? String
        
    }
    
}

