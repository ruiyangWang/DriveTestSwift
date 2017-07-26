//
//  HomeController.swift
//  DriveTestSwift
//
//  Created by ios on 2017/3/7.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh

class HomeController: SZBaseViewController {
    
    var dataArray = Array<PassengerModel>()
    var label = UILabel()
    
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
    
        HTTPTool.shard.loadPassengerList(success: { (passangerArray) in
            self.dataArray = passangerArray
            self.tableView.reloadData()
            self.tableView.mj_header.endRefreshing()
        }) { (id) in
            self.tableView.mj_header.endRefreshing()
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
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.loadDataFormNetWork()
        })
        
        let rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        rightButton.setTitle("+", for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonClick), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightButton)
    
        let redButton = UIButton(type: .custom)
        redButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        redButton.addTarget(self, action: #selector(rightButtonClick), for: .touchUpInside)
        view.addSubview(redButton)
    
//        label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        label.backgroundColor = UIColor.red
//        kWindow?.addSubview(label)
    }
    

    
    func rightButtonClick() {
    
        let action = RYAlertView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        action.addTitles(title: ["相机", "从相册选取", "测试按钮二", "测试按钮1"], isShowCancle: false)
        action.delegete = self
        kWindow?.addSubview(action)
        
        //labelAnimation()
    }
    
    //动画效果
    func labelAnimation() {
    
        
        
        //弹簧动画
        if #available(iOS 9.0, *) {
            let spring = CASpringAnimation(keyPath: "position.y")
            spring.damping = 5;
            spring.stiffness = 100;
            spring.mass = 4;
            spring.initialVelocity = 3;
            spring.fromValue = label.layer.position.y;
            spring.toValue = label.layer.position.y + 50;
            spring.duration = spring.settlingDuration;
            label.layer.add(spring, forKey: spring.keyPath)
        } else {
            // Fallback on earlier versions
        }
        
        //形变动画
        let animation = CAKeyframeAnimation(keyPath: "transform")
        var array = Array<Any>()
        array.append(NSValue(caTransform3D: CATransform3DMakeScale(0.5, 0.5, 0.5)))
        array.append(NSValue(caTransform3D: CATransform3DMakeScale(1.2, 1.2, 1.2)))
        array.append(NSValue(caTransform3D: CATransform3DMakeScale(0.9, 0.9, 0.9)))
        array.append(NSValue(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)))
        animation.values = array;
        label.layer.add(animation, forKey: "transform")
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return dataArray.count
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePassengerCell")
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeController: RYAlertViewDelegete {
    
    func clickIndex(alertView: RYAlertView, index: Int) {
        
        print("点击了\(index)行---------")
    }
}

