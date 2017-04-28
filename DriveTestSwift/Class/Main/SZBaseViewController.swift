//
//  SZBaseViewController.swift
//  DriveTestSwift
//
//  Created by ios on 2017/3/7.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit
import SVProgressHUD

class SZBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = ViewControllerBackgroundColor
        
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setMinimumDismissTimeInterval(2.0)
        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
        SVProgressHUD.setForegroundColor(UIColor.white)
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
