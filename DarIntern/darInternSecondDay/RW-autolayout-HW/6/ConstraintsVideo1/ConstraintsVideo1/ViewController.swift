//
//  ViewController.swift
//  ConstraintsVideo1
//
//  Created by Aibol Tungatarov on 7/12/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchLabel = UILabel()
        searchLabel.text = "Search: "
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchLabel)
        
        let searchTextField = UITextField()
        searchTextField.borderStyle = .roundedRect
        searchTextField.placeholder = "Text here"
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
        
        let searchBtn = UIButton()
        searchBtn.setTitle("Lookup!", for: .normal)
        searchBtn.setTitleColor(.black, for: .normal)
        searchBtn.setTitleColor(.blue, for: .highlighted)
        searchBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBtn)
        
        // searchLabel's constraints
        NSLayoutConstraint(item: searchLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: searchLabel, attribute: .firstBaseline, relatedBy: .equal, toItem: searchTextField, attribute: .firstBaseline, multiplier: 1.0, constant: 0.0).isActive = true
        
        // searchTextField's constraints
        NSLayoutConstraint(item: searchTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: searchTextField, attribute: .top, relatedBy: .equal, toItem: topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 20.0).isActive = true
        NSLayoutConstraint(item: searchTextField, attribute: .leading, relatedBy: .equal, toItem: searchLabel, attribute: .trailing, multiplier: 1.0, constant: 10.0).isActive = true
        
        //searchBtn's constraints
        NSLayoutConstraint(item: searchBtn, attribute: .trailing, relatedBy: .equal, toItem: searchTextField, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: searchBtn, attribute: .top, relatedBy: .equal, toItem: searchTextField, attribute: .bottom, multiplier: 1.0, constant: 10.0).isActive = true
        
    }


}

