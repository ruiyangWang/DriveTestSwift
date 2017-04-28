//
//  HTTPTool.swift
//  DriveTestSwift
//
//  Created by ios on 2017/4/10.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class HTTPTool: NSObject {

    static let shard = HTTPTool()
    
    
    //获取验证码
    func getCode(phone: String) {
        
        let urlString = ServersIP + "/admin-webapp/loginapi/appdevice/login"
        let para = [
            "phone" : phone,
            "type" : "get",
            "source" : "trial"
        ]
        Alamofire.request(urlString, method: .post, parameters: para).responseJSON { (response) in
            print(urlString + "\n" + "\(para)")
            
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "获取验证码失败")
                return
            }
            
            if let value = response.result.value {
                let dict = JSON(value)
                print(dict)
                
                let stateCode = dict["code"].stringValue
                
                guard stateCode == "S_OK" else {
                    let message = dict["var"].stringValue
                    SVProgressHUD.showError(withStatus: message)
                    return
                }
                
                SVProgressHUD.showSuccess(withStatus: "获取验证码成功")
            }
        }
    }
    
    //登录，获取SID
    func loginMethod(phone: String, code: String){
        
        let urlString = ServersIP + "/admin-webapp/loginapi/appdevice/login"
        let para = [
            "phone" : phone,
            "type" : "get",
            "source" : "trial",
            "idCode" : code
        ]
        
        Alamofire.request(urlString, method: .post, parameters: para, encoding: JSONEncoding.default).responseJSON { (response) in
            
            print(urlString + "\n" + "\(para)")
            
            guard response.result.isSuccess else {
    
                SVProgressHUD.showError(withStatus: "登录失败")
                return
            }
            
            if let value = response.result.value {
                let dict = JSON(value)
                
                print(dict)
                
                let stateCode = dict["code"].stringValue
                
                guard stateCode == "S_OK" else {
                    let message = dict["var"].stringValue
                    SVProgressHUD.showInfo(withStatus: message)
                    return
                }
                
                SID = dict["var"].stringValue
            
            }
        }
    }
    
    //首页获取客流列表
    func loadPassengerList(success: @escaping ((_ result: [PassengerModel]) -> ())){
        SVProgressHUD.show(withStatus: "正在加载...")
        
        let urlString = ServersIP + "/passenger/trialListPassenger?" + SID
        print(urlString)
        
        Alamofire.request(urlString, method: .post, parameters: ["" : ""], encoding: JSONEncoding.default).responseJSON { (response) in
        
            print(response.error ?? "")
            guard response.result.isSuccess else {
                print("加载失败...")
                
                SVProgressHUD.showError(withStatus: "加载失败")

                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].stringValue
                let message = dict["var"].stringValue
                
                guard code == "S_OK" else {
                    print(message)
                    return
                }
                
                if let array = dict["var"].arrayObject {
                    var pArray = [PassengerModel]()
                    for d  in array {
                        let model = PassengerModel.init(dict: d as! [String : AnyObject])
                        pArray.append(model)
                    }
                    success(pArray)
                }
                
            }
            
        }
        
    }
    
    //GET
    func getWithAlamofire(url: String, parameters: Dictionary<String,Any>?, success: @escaping ((_ result: Any) -> ()), failure: @escaping ((_ error: Error) -> ())) {
        
        Alamofire.request(url).responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showInfo(withStatus: "失败")
                return
            }
            
            
        }
    }
    
    //POST
    func postWithPath(path: String, paras: Dictionary<String,Any>?, success: @escaping ((_ result: Any) -> ()), failure: @escaping ((_ error: Error) -> ())){
    
        var i = 0
        var address = ""
        
        if let paras = paras {
            for (key, value) in paras {
                
                if i == 0 {
                    address += "\(key)=\(value)"
                } else {
                    address += "&\(key)=\(value)"
                }
                i += 1
            }
        }
        
        let url = URL(string: path)
        print(address)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POSt"
        request.httpBody = address.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                if let result = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    
                    success(result)
                }
                
                
            } else {
                failure(error!)
            }
            
        }
        task.resume()
        
    }
    
    
}


