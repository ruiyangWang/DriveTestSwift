//
//  LoginController.swift
//  DriveTestSwift
//
//  Created by ios on 2017/4/17.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class LoginController: SZBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonClick(_ sender: UIButton) {
        //获取验证码
        HTTPTool.shard.getCode(phone: "18503019702")
        
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
