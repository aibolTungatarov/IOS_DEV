//
//  ViewController.swift
//  Astro Torch
//
//  Created by Aibol Tungatarov on 4/15/19.
//  Copyright © 2019 Mac Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var num = 0
    @IBAction func convertB(_ sender: UIButton) {
        changeBackgroundColor(sender: sender)
    }
    func changeBackgroundColor(sender: UIButton){
        if num == 0{
            self.view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
            sender.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            num = 1
        }else{
            self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            sender.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            num = 0
        }
    }

}

