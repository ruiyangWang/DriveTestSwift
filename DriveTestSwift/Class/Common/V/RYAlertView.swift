//
//  RYAlertView.swift
//  DriveTestSwift
//
//  Created by ios on 2017/4/26.
//  Copyright © 2017年 ios. All rights reserved.
//

import UIKit

@objc protocol RYAlertViewDelegete {
    
    func clickIndex(alertView: RYAlertView, index: Int)
    
}

enum RYConst {
    
    static let SCREEN_WIDTH = UIScreen.main.bounds.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.height
}

class RYAlertView: UIView {

    let cellHeight: CGFloat = 44 //底部cell高度
    
    let backView = UIView()
    
    let contentView = UIView()
    
    var bottomHeight: CGFloat = 0 //底部菜单高度,默认是0
    
    weak var delegete: RYAlertViewDelegete?
    
    private var titles = Array<String>()
    private var btnCount = 1
    
    func addTitles(title: Array<String>, isShowCancle: Bool) {
        
        titles = title
        btnCount = title.count
        
        bottomHeight = cellHeight * CGFloat(btnCount) + (isShowCancle ? (cellHeight + 10) : 0)
        
        self.setView()
        
        self.show()
    }
    
    
    
    
    /// 私有方法
    ///
    /// - Parameter frame:
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView(){
    
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(hideAlert))
        backView.addGestureRecognizer(tap)
        backView.isUserInteractionEnabled = true

        backView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        backView.backgroundColor = UIColor.black
        addSubview(backView)
        
        contentView.frame = CGRect(x: 0.0, y: SCREEN_HEIGHT, width: CGFloat(RYConst.SCREEN_WIDTH), height: CGFloat(bottomHeight))
        contentView.backgroundColor = UIColor(hexColor: "ebf2f5")
        addSubview(contentView)
        
        for index in 0..<btnCount {
            let title = titles[index]
            let btn = UIButton(type: .custom)
            btn.tag = index
            btn.setTitle(title, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.frame = CGRect(x: 0.0, y: cellHeight * CGFloat(index), width: SCREEN_WIDTH, height: CGFloat(cellHeight))
            btn.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
            btn.setTitleColor(UIColor(hexColor: "354052"), for: .normal)
            btn.backgroundColor = UIColor.white
            contentView.addSubview(btn)
            
            if index != btnCount - 1 {
                let line = UIView(frame: CGRect(x: 0, y: btn.maxY - 0.5, width: RYConst.SCREEN_WIDTH, height: 0.5))
                line.backgroundColor = UIColor(hexColor: "e2e2e2")
                contentView.addSubview(line)
            }
            
        }
        
        //取消按钮
        let cancleBtn = UIButton(type: .custom)
        cancleBtn.frame = CGRect(x: 0, y: bottomHeight - cellHeight, width: RYConst.SCREEN_WIDTH, height: cellHeight)
        cancleBtn.setTitle("取消", for: .normal)
        cancleBtn.setTitleColor(UIColor(hexColor: "a0abbf"), for: .normal)
        cancleBtn.backgroundColor = UIColor.white
        cancleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        cancleBtn.addTarget(self, action: #selector(hideAlert), for: .touchUpInside)
        contentView.addSubview(cancleBtn)
        
    }

    @objc private func buttonClick(sender: UIButton){
    
        self.hideAlert()
        
        if delegete != nil {
            delegete?.clickIndex(alertView: self, index: sender.tag)
        }
    }
    
    @objc private func hideAlert() {
        
        UIView.animate(withDuration: 0.25, animations: { 
            
            self.backView.alpha = 0
            
            self.contentView.y = SCREEN_HEIGHT
            
        }) { (b) in
            
            self.isHidden = true
        }
    }
    
    
    private func show() {
        
        self.isHidden = false
        
        backView.alpha = 0
        
        contentView.y = SCREEN_HEIGHT
        
        
        UIView.animate(withDuration: 0.25, animations: {
        
            self.backView.alpha = 0.4
            
            self.contentView.y = SCREEN_HEIGHT - CGFloat(self.bottomHeight)
            
        }) { (c) in
            
        }
        
        
    }
    
}


