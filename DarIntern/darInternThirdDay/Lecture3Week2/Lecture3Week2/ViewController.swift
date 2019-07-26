//
//  ViewController.swift
//  Lecture3Week2
//
//  Created by Aibol Tungatarov on 7/16/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstBtn: UIButton!
    var secondBtn: UIButton!
    var thirdBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstBtn = setupBtns(with: "Click me!", bgcolor: UIColor.red)
        secondBtn = setupBtns(with: "Second me!", bgcolor: UIColor.blue)
        thirdBtn = setupBtns(with: "Third me!", bgcolor: UIColor.green)
        
        secondBtn.alpha = 0
        thirdBtn.alpha = 0
        
        setupConstraints()
    }
    
    
    
    func setupBtns(with title: String, bgcolor: UIColor) -> UIButton{
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.backgroundColor = bgcolor
        btn.setTitle(title, for: .normal)
        view.addSubview(btn)
        
        return btn
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]-10-[v1]-10-[v2]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":firstBtn, "v1":secondBtn,"v2":thirdBtn]))
        firstBtn.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked(sender : UIButton){
        UIView.animate(withDuration: 2) {
            self.secondBtn.alpha = 1
            self.thirdBtn.alpha = 1
        }
        
    }
    


}

