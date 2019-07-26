//
//  Item.swift
//  Challenge4
//
//  Created by Aibol Tungatarov on 7/14/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import Foundation
import UIKit

struct Item {
    public var image: UIImage
    public var name: String
    public var desc: String
    
    init(name: String, desc: String, image: UIImage) {
        self.image = image
        self.desc = desc
        self.name = name
    }
    
}
