//
//  ViewController.swift
//  first
//
//  Created by Aibol Tungatarov on 4/25/19.
//  Copyright © 2019 Mac Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentVal: Int = 0;
    var targetVal: Int = 0;
    var round: Int = 0;
    var score: Int = 0;
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentVal = Int(slider.value.rounded());
        let edgeInsets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let sliderThumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let sliderThumbImageHighLighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(sliderThumbImageNormal,for:.normal);
        slider.setThumbImage(sliderThumbImageHighLighted, for:.highlighted);
        let sliderTrackImageLeft = #imageLiteral(resourceName: "SliderTrackLeft")
        let sliderTrackImageLeftResizeable = sliderTrackImageLeft.resizableImage(withCapInsets: edgeInsets);
        slider.setMinimumTrackImage(sliderTrackImageLeftResizeable, for:.normal);
        let sliderTrackImageRight = #imageLiteral(resourceName: "SliderTrackRight")
        let sliderTrackImageRightResizeable = sliderTrackImageRight.resizableImage(withCapInsets: edgeInsets);
        slider.setMaximumTrackImage(sliderTrackImageRightResizeable, for:.normal);
        
        
        updateLabels();
        startNewGame();
    }
    @IBAction func startOverBtnPressed(_ sender: Any) {
        startNewGame();
    }
    @IBAction func hitBtnPressed(_ sender: Any) {
        let thisRoundsScore = 100 - abs(currentVal - targetVal);
        var title: String;
        if thisRoundsScore == 100{
            title = "Perfect";
            score += 100
        }
        else if thisRoundsScore >= 95{
            title = "Good Guess";
            score += 50
        }
        else if thisRoundsScore >= 90{
            title = "Not bad";
            score += 25
        }
        else{
            title = "Not even closer.Try again";
        }
        let alert = UIAlertController(title: title, message: "You hit : \(currentVal) and targetVal is \(targetVal)", preferredStyle: .alert);
        let action = UIAlertAction(title: "Yeah", style: .default, handler: {
            action in
            self.startNewRound();
        })
        alert.addAction(action);
        present(alert, animated: true, completion: nil)
    }
    func startNewRound(){
        
        round+=1;
        targetVal = Int.random(in: 1...100);
        currentVal = 50;
        updateLabels();
        slider.value = Float(currentVal);
    }
    @IBAction func sliderMoved(_ slider: UISlider){
        currentVal = Int(slider.value.rounded());
    }
    func updateLabels(){
        targetLabel.text = String(targetVal);
        roundLabel.text = String(round);
        scoreLabel.text = String(score);
    }
    func startNewGame(){
        round = 0;
        score = 0;
        startNewRound();
    }
}


