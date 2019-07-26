//
//  ViewController.swift
//  Challenge4
//
//  Created by Aibol Tungatarov on 7/14/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    var itemsArr = [Item(name: "Bird", desc: "Frist Item", image: UIImage(named: "bird")!), Item(name: "Tiger", desc: "Second Item", image: UIImage(named: "tiger")!), Item(name: "Horse", desc: "Third Item", image: UIImage(named: "horse")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        let item = itemsArr[indexPath.row]
        cell.cellImage.image = item.image
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nameLabel.text = itemsArr[indexPath.row].name
        desc.text = itemsArr[indexPath.row].desc
        
        for index in 0..<itemsArr.count {
            
            if(indexPath.row != index) {
                let cell = collectionView.cellForItem(at: IndexPath(row: index, section: 0)) as! ImageCollectionViewCell
                cell.imageTrailingContraint.constant = 20
                cell.imageBottomConstraint.constant = 20
            }
            else {
                let cell = collectionView.cellForItem(at: indexPath) as! ImageCollectionViewCell
                cell.imageBottomConstraint.constant = 0
                cell.imageTrailingContraint.constant = 0
            }
        }
        collectionView.layoutIfNeeded()
    }
    
    
}

