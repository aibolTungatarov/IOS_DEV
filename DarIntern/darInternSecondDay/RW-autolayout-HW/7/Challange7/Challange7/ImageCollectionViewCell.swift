//
//  ImageCollectionViewCell.swift
//  Challenge4
//
//  Created by Aibol Tungatarov on 7/14/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blue
    }
    
}
