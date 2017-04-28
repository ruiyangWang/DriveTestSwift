//
//  ViewController.swift
//  DriveTestSwift
//
//  Created by ios on 2017/3/7.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: SZBaseViewController {

    var codeTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createView()
    }
    
    func createView(){
        
        let nameLabel = UILabel(frame: CGRect(origin: self.view.center, size: CGSize(width: 200, height: 40)))
        nameLabel.text = "swift试驾"
        nameLabel.textColor = UIColor.red
        view.addSubview(nameLabel)
        
        
        let loginButton = UIButton.init(type: .custom)
        loginButton.setBackgroundImage(#imageLiteral(resourceName: "login-_btn_normal"), for: .normal)
        loginButton.setTitle("验证码", for: .normal)
        loginButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        loginButton.addTarget(self, action: #selector(loginButtonClick(_:)), for: .touchUpInside)
        view.addSubview(loginButton)
        
        view.backgroundColor = UIColor.white
    
        let loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.backgroundColor = UIColor.red
        loginBtn.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        loginBtn.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        view.addSubview(loginBtn)
        
        codeTextField.frame = CGRect(x: 100, y: 400, width: 200, height: 50)
        codeTextField.placeholder = "验证码"
        view.addSubview(codeTextField)
    }
    
    func loginButtonClick(_ sender: UIButton){
        
        HTTPTool.shard.loginMethod(phone: "18585642531", code: "")
        
    }
    
    func login(_ sender: Any) {
        let code = codeTextField.text
        
        if let code = code {
            HTTPTool.shard.loginMethod(phone: "18585642531", code: code)
        } else {
            SVProgressHUD.showInfo(withStatus: "请填写验证码")
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

