//
//  MeController.swift
//  DriveTestSwift
//
//  Created by ios on 2017/3/7.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

class MeController: SZBaseViewController {

    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "ddd")
        tableView.rowHeight = 44.0
        
        self.view.addSubview(tableView)
        
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
extension MeController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ddd")
        cell?.textLabel?.text = "中文"
        return cell!
    }
}
