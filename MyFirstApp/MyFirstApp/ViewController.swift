//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Mac Pro on 1/29/19.
//  Copyright © 2019 Mac Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = ConcentrationModel(numberOfPairsOfCards: (cardButtons.count + 1)/2 )
    var arrayOfEmojies = ["👻", "🎃", "🤡", "👿", "☠️", "👽", "🐶", "🐭", "🐝", "🦄", "🦉", "🦕"].shuffled()
    var points: Int = 0;
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel();
        }
        else{
            print("ELSE");
        }
    }
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if(card.isFaceUp){
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMathchedUp ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String{
        return arrayOfEmojies[card.identifier]
    }
}

