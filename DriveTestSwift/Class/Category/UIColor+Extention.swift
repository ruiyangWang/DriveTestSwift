//
//  UIColor+Extention.swift
//  DriveTestSwift
//
//  Created by ios on 2017/3/9.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

extension UIColor {
    
    func colorFormHex(_ hex: Int) -> UIColor {
        
        
        return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0,
                     green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0,
                      blue: ((CGFloat)(hex & 0xFF)) / 255.0,
                     alpha: 1.0)
    }
    
    /// 用十六进制颜色创建UIColor
    ///
    /// - Parameter hexColor: 十六进制颜色 (0F0F0F)
    convenience init(hexColor: String) {
        
        // 存储转换后的数值
        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
        
        // 分别转换进行转换
        Scanner(string: hexColor[0..<2]).scanHexInt32(&red)
        
        Scanner(string: hexColor[2..<4]).scanHexInt32(&green)
        
        Scanner(string: hexColor[4..<6]).scanHexInt32(&blue)
        
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
}
