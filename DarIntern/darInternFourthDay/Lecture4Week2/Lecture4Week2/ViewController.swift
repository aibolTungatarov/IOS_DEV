//
//  ViewController.swift
//  Lecture4Week2
//
//  Created by Aibol Tungatarov on 7/18/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let scrollView: UIScrollView = {
        var sc = UIScrollView()
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.backgroundColor = .red
        return sc
    }()
    
    let topLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "YY"
        label.backgroundColor = .blue
        return label
    }()
    
    let emailTextField: UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTextField: UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let bottomLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "YY"
        label.backgroundColor = .green
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        makeConstraints()
        
        
    }
    
    func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(topLabel)
        scrollView.addSubview(bottomLabel)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(emailTextField)
        
    }
    
    func makeConstraints() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        topLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        
        bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 1000).isActive = true
        bottomLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        bottomLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        bottomLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -100).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 200).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        emailTextField.delegate = self
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        passwordTextField.delegate = self
    
        
        
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        guard let userInfo = notification.userInfo else { return }
        
        if let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let keyboardSize = keyboardRect.size
            UIView.animate(withDuration: 1) {
                self.scrollView.setContentOffset(CGPoint(x: 0, y: keyboardSize.height), animated: true)
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
            UIView.animate(withDuration: 1) {
                self.scrollView.setContentOffset(.zero, animated: true)
            }
    }
    
    


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.resignFirstResponder()
        return true
    }
}
