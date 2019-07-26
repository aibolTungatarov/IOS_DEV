//
//  ViewController.swift
//  ConstraintsInCodeVideo2
//
//  Created by Aibol Tungatarov on 7/13/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstNameLabel = UILabel()
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.text = "First Name: "
        view.addSubview(firstNameLabel)
        
        let firstNameTextField = UITextField()
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        firstNameTextField.borderStyle = .roundedRect
        view.addSubview(firstNameTextField)
        
        
        let lastNameLabel = UILabel()
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.text = "Last Name: "
        view.addSubview(lastNameLabel)
        
        let lastNameTextField = UITextField()
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextField.borderStyle = .roundedRect
        view.addSubview(lastNameTextField)
        
        
        let popStarLabel = UILabel()
        popStarLabel.translatesAutoresizingMaskIntoConstraints = false
        popStarLabel.text = "Pop Star: "
        view.addSubview(popStarLabel)
        
        let popStarTextField = UITextField()
        popStarTextField.translatesAutoresizingMaskIntoConstraints = false
        popStarTextField.borderStyle = .roundedRect
        view.addSubview(popStarTextField)
        
        
        let howManyStatesLabel = UILabel()
        howManyStatesLabel.translatesAutoresizingMaskIntoConstraints = false
        howManyStatesLabel.text = "How Many States: "
        view.addSubview(howManyStatesLabel)
        
        let howManyStatesTextField = UITextField()
        howManyStatesTextField.translatesAutoresizingMaskIntoConstraints = false
        howManyStatesTextField.borderStyle = .roundedRect
        view.addSubview(howManyStatesTextField)
        
        
        let rapperLabel = UILabel()
        rapperLabel.translatesAutoresizingMaskIntoConstraints = false
        rapperLabel.text = "Rapper: "
        view.addSubview(rapperLabel)
        
        let rapperTextField = UITextField()
        rapperTextField.translatesAutoresizingMaskIntoConstraints = false
        rapperTextField.borderStyle = .roundedRect
        view.addSubview(rapperTextField)
        
        
        let realAgeLabel = UILabel()
        realAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        realAgeLabel.text = "Real Age: "
        view.addSubview(realAgeLabel)
        
        
        let realAgeTextField = UITextField()
        realAgeTextField.translatesAutoresizingMaskIntoConstraints = false
        realAgeTextField.borderStyle = .roundedRect
        view.addSubview(realAgeTextField)
        
        
        let leftBtn = UIButton()
        leftBtn.translatesAutoresizingMaskIntoConstraints = false
        leftBtn.setTitle("Left Button", for: .normal)
        leftBtn.setTitleColor(.red, for: .normal)
        leftBtn.backgroundColor = .blue
        view.addSubview(leftBtn)
        
        
        let rightBtn = UIButton()
        rightBtn.translatesAutoresizingMaskIntoConstraints = false
        rightBtn.setTitle("Right Button", for: .normal)
        rightBtn.setTitleColor(.red, for: .normal)
        rightBtn.backgroundColor = .blue
        view.addSubview(rightBtn)
    }


}

