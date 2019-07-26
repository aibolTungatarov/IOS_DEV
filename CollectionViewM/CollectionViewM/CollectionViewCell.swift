//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Aibol Tungatarov on 5/22/19.

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    var isEditing: Bool = false {
        didSet {
            imageLabel.isHidden = !isEditing
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isEditing {
                imageLabel.image = isSelected ? UIImage(named: "Checked") : UIImage(named: "Unchecked")
            }
        }
    }
}
