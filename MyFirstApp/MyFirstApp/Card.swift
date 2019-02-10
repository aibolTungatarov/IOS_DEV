//
//  Card.swift
//  MyFirstApp
//
//  Created by Mac Pro on 1/31/19.
//  Copyright © 2019 Mac Pro. All rights reserved.
//

import Foundation

struct Card{
    var isMathchedUp = false
    var identifier = 0
    var isFaceUp = false
    static var uniqueIdentifier = 0
    init(){
        identifier = Card.getUniqueIdentifier()
    }
    static func getUniqueIdentifier() -> Int{
        uniqueIdentifier += 1
        return uniqueIdentifier
    }
}
