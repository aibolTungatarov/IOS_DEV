//
//  LogInViewController.swift
//  ChaChat
//
//  Created by Mac Pro on 3/1/19.
//  Copyright © 2019 Mac Pro. All rights reserved.
//

import UIKit
class LogInViewController: UIViewController {

    @IBAction func signInPressed(_ sender: UIButton) {
        if let pswd = passwordTextField.text,
            let email = emailTextField.text{
            if (email.count > 6){
                emailTextField.backgroundColor = UIColor.white
            }
            else{
                emailTextField.backgroundColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 1)
            }
            if (pswd.count > 6){
                passwordTextField.backgroundColor = UIColor.white
            }
            else{
                passwordTextField.backgroundColor = UIColor.init(red: 0.8, green: 0, blue: 0, alpha: 1)
            }
        }
        
    }
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
    }
}
