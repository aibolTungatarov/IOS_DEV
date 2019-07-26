//
//  ViewController.swift
//  Lecture2Week1
//
//  Created by Aibol Tungatarov on 7/11/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBtn = UIButton()
        leftBtn.backgroundColor = .red
        leftBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let rightBtn = UIButton()
        rightBtn.backgroundColor = .blue
        rightBtn.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(leftBtn)
        view.addSubview(rightBtn)
        
        let guide = view.safeAreaLayoutGuide
    
        leftBtn.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.bottom.equalTo(guide)
            make.left.equalTo(guide).offset(20)
            make.width.equalTo(rightBtn.snp.width)
        }
        
        rightBtn.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.bottom.equalTo(guide)
            make.right.equalTo(guide).offset(-20)
            make.left.equalTo(leftBtn.snp.right).offset(20)
        }
        
    }
    
    


}

