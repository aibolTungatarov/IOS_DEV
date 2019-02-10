//
//  ConcentrationModel.swift
//  MyFirstApp
//
//  Created by Mac Pro on 1/31/19.
//  Copyright © 2019 Mac Pro. All rights reserved.
//

import Foundation

class ConcentrationModel{
    var firstChoosed: Int?
    var cards = [Card]()
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
    }
    func chooseCard(at index : Int){
        var card = cards[index];
        if(!card.isMathchedUp){
            if let matchIndex = firstChoosed , matchIndex != index{
                if(card.identifier == cards[matchIndex].identifier){
                    cards[matchIndex].isMathchedUp = true
                    card.isMathchedUp = true
                }
                card.isFaceUp = true
                firstChoosed = nil
            }
            else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                firstChoosed = index
            }
        }
    }
}
