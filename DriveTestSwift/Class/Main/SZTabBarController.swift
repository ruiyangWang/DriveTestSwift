//
//  SZTabBarController.swift
//  DriveTestSwift
//
//  Created by ios on 2017/3/7.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class SZTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let homeVC = HomeController()
        let homeNVC = SZNavigationController()
        homeNVC.addChildViewController(homeVC)
        self.addChildViewController(homeNVC)
        homeVC.title = "首页"
        homeVC.tabBarItem.image = #imageLiteral(resourceName: "tab_home_sel")
        
        let custmoerVC = CustomerListController()
        let customerNVC = SZNavigationController()
        customerNVC.addChildViewController(custmoerVC)
        self.addChildViewController(customerNVC)
        custmoerVC.title = "客户列表"
        
        let rechargeVC = RechargeListController()
        let rechargeNVC = SZNavigationController()
        rechargeNVC.addChildViewController(rechargeVC)
        self.addChildViewController(rechargeNVC)
        rechargeVC.title = "充值"
        
        let meVC = MeController()
        let meNVC = SZNavigationController()
        meNVC.addChildViewController(meVC)
        self.addChildViewController(meNVC)
        meVC.title = "我的"
    
        
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
