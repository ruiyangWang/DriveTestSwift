//
//  HomeController.swift
//  DriveTestSwift
//
//  Created by ios on 2017/3/7.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit
import Alamofire

class HomeController: SZBaseViewController {
    
    var dataArray = Array<PassengerModel>()
    
    
    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.yellow
        // Do any additional setup after loading the view.
        
        setupView()
        
        loadDataFormNetWork()
    }
    
    //网络数据
    func loadDataFormNetWork(){
    
        HTTPTool.shard.loadPassengerList { (result) in
            
            self.dataArray = result
        }
        
    }
    
    fileprivate func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 74.0
        view.addSubview(tableView)
        let nib = UINib(nibName: "HomePassengerCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HomePassengerCell")
        
        let rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        rightButton.setTitle("+", for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonClick), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightButton)
    
    }
    
    func rightButtonClick() {
    
        let action = RYAlertView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        action.addTitles(title: ["相机", "从相册选取", "测试按钮二", "测试按钮1"], isShowCancle: false)
        action.delegete = self
        kWindow??.addSubview(action)
        
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension HomeController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePassengerCell")
        
        return cell!
    }
    
}

extension HomeController: RYAlertViewDelegete {
    
    func clickIndex(alertView: RYAlertView, index: Int) {
        
        print("点击了\(index)行---------")
    }
}

