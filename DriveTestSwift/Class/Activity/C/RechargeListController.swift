//
//  RechargeListController.swift
//  DriveTestSwift
//
//  Created by ios on 2017/7/10.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

let rechargeListCellID = "RechargeListCell"

class RechargeListController: SZBaseViewController {

    let tableview = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    func createView() {
        
        tableview.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register((object_getClass(RechargeListCell.self)), forCellReuseIdentifier: rechargeListCellID)
        view.addSubview(tableview)
        
        
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

extension RechargeListController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return RechargeListCell.returnRechargeCell(tableView)
    }
}
