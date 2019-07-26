//
//  MenuBarCell.swift
//  youtube
//
//  Created by Aibol Tungatarov on 7/22/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit

class MenuBarCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.rgbColor(r: 91, g: 14, b: 13)
        return iv
    }()
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgbColor(r: 91, g: 14, b: 13)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgbColor(r: 91, g: 14, b: 13)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: imageView)
        addConstraintsWithFormat(format: "H:[v0(28)]", views: imageView)
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
