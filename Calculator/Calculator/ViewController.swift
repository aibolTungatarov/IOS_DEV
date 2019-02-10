//
//  ViewController.swift
//  Calculator
//
//  Created by Mac Pro on 1/30/19.
//  Copyright © 2019 Mac Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    var isThereSign = false;
    var mathSign = "";
    var result = "" {
        didSet{
            resultLabel.text = result
        }
    }
    var firstNumber = "";
    @IBAction func btnPressed(_ sender: UIButton) {
        let id = sender.tag;
        if(id >= 0 && id <= 9){
            if(isThereSign) {
                isThereSign = false
                result = String(sender.tag)
            }
            else{
                result += String(sender.tag)
            }
        }
        else if(id == 10){
            result = "";
            mathSign = "";
            isThereSign = false;
        }
        else if(id == 11){
            if result != ""{
                result = String( Int(result)! * (-1))
            }
        }
        else if(id >= 12 && id <= 16){
            print("Working here 1")
            firstNumber = result
            print("Working here and \(firstNumber)")
            isThereSign = true
            if(id == 12){
                result = "%"
            }
            else if(id == 13){
                result = "÷"
            }
            else if(id == 14){
                result = "×"
            }
            else if(id == 15){
                result = "-"
            }
            else if(id == 16){
                result = "+"
            }
            mathSign = result
        }
        else if(id == 17){
            if(mathSign == "+"){
                result = String(Double(result)! + Double(firstNumber)!)
            }
            else if(mathSign == "-"){
                result = String(Double(result)! - Double(firstNumber)!)
            }
            else if(mathSign == "÷"){
                result = String(Double(result)! / Double(firstNumber)!)
            }
            else if(mathSign == "×"){
                result = String(Double(result)! * Double(firstNumber)!)
            }
            else if(mathSign == "%"){
                result = String(Int(result)! % Int(firstNumber)!)
            }
            else{
                result = "";
            }
        }
    }
}
