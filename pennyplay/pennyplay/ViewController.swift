//
//  ViewController.swift
//  pennyplay
//
//  Created by Aibol Tungatarov on 5/6/19.
//  Copyright © 2019 aibolProd. All rights reserved.
//

import UIKit
import MediaPlayer
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The value of a slider: \(slider.value)")
    }


}

