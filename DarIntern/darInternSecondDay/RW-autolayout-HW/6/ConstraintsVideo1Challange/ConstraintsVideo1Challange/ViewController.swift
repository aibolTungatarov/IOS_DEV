//
//  ViewController.swift
//  ConstraintsVideo1Challange
//
//  Created by Aibol Tungatarov on 7/12/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wrapper = UIView()
        wrapper.backgroundColor = .yellow
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wrapper)
        
        let usernameLabel = UILabel()
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.text = "Username: "
        wrapper.addSubview(usernameLabel)
        
        
        let usernameTextField = UITextField()
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username here"
        wrapper.addSubview(usernameTextField)
        
        
        let passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Password: "
        wrapper.addSubview(passwordLabel)
        
        
        let passwordTextField = UITextField()
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password here"
        wrapper.addSubview(passwordTextField)
        
        
        let submitBtn = UIButton()
        submitBtn.translatesAutoresizingMaskIntoConstraints = false
        submitBtn.setTitle("Submit", for: .normal)
        submitBtn.setTitleColor(.black, for: .normal)
        wrapper.addSubview(submitBtn)
        
        
        //wrapper's constraints
        NSLayoutConstraint(item: wrapper, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: wrapper, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: wrapper, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        //usernameLabel's constraints
        NSLayoutConstraint(item: usernameLabel, attribute: .top, relatedBy: .equal, toItem: wrapper, attribute: .topMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: usernameLabel, attribute: .leading, relatedBy: .equal, toItem: wrapper, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        usernameLabel.setContentHuggingPriority(.defaultHigh, for: NSLayoutConstraint.Axis.horizontal)
        usernameLabel.setContentCompressionResistancePriority(.defaultLow, for: NSLayoutConstraint.Axis.horizontal)
        
        
        //usernameTextField's constraints
        NSLayoutConstraint(item: usernameTextField, attribute: .top, relatedBy: .equal, toItem: usernameLabel, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: usernameTextField, attribute: .leading, relatedBy: .equal, toItem: usernameLabel, attribute: .trailingMargin, multiplier: 1.0, constant: 20.0).isActive = true
        NSLayoutConstraint(item: usernameTextField, attribute: .trailing, relatedBy: .equal, toItem: wrapper, attribute: .trailingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        usernameTextField.setContentCompressionResistancePriority(.defaultHigh, for: NSLayoutConstraint.Axis.horizontal)
        
        
        //passwordLabel's constraints
        NSLayoutConstraint(item: passwordLabel, attribute: .top, relatedBy: .equal, toItem: usernameLabel, attribute: .bottomMargin, multiplier: 1.0, constant: 30.0).isActive = true
        NSLayoutConstraint(item: passwordLabel, attribute: .leading, relatedBy: .equal, toItem: usernameLabel, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        //passwordTextField's constraints
        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: passwordLabel, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: usernameTextField, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: usernameTextField, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        
        //submitBtn's constraints
        NSLayoutConstraint(item: submitBtn, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: submitBtn, attribute: .top, relatedBy: .equal, toItem: passwordTextField, attribute: .bottom, multiplier: 1.0, constant: 20.0).isActive = true
        
        NSLayoutConstraint(item: wrapper, attribute: .bottom, relatedBy: .equal, toItem: submitBtn, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        
        
        
    }


}

