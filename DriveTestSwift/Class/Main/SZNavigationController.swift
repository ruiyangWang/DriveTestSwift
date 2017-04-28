//
//  SZNavigationController.swift
//  DriveTestSwift
//
//  Created by ios on 2017/3/7.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class SZNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    
    internal override class func initialize() {
        super.initialize()
        /// 设置导航栏标题
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = NavBackgroundColor
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.init(hexColor: "a0abbf")]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
