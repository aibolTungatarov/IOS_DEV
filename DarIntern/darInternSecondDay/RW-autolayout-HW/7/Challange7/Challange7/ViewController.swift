//
//  ViewController.swift
//  Challange7
//
//  Created by Aibol Tungatarov on 7/15/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let desc: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    var collectionView: UICollectionView!
    var itemsArr = [Item(name: "Bird", desc: "Frist Item", image: UIImage(named: "bird")!), Item(name: "Tiger", desc: "Second Item", image: UIImage(named: "tiger")!), Item(name: "Horse", desc: "Third Item", image: UIImage(named: "horse")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
    
        view.addSubview(nameLabel)
        view.addSubview(desc)
        
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        desc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        desc.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30).isActive = true
        desc.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        desc.heightAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
        
        
        
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        let item = itemsArr[indexPath.row]
        let image = UIImageView(image: item.image)
        cell.translatesAutoresizingMaskIntoConstraints = false
        cell.widthAnchor.constraint(equalToConstant: collectionView.frame.width/5).isActive = true
        cell.heightAnchor.constraint(equalToConstant: collectionView.frame.height-20).isActive = true
        cell.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:20-[v0]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":cell]))
        cell.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nameLabel.text = itemsArr[indexPath.row].name
        desc.text = itemsArr[indexPath.row].desc
        for index in 0..<itemsArr.count {
            
            if(indexPath.row != index) {
                let cell = collectionView.cellForItem(at: IndexPath(row: index, section: 0)) as! ImageCollectionViewCell
                
            }
            else {
                let cell = collectionView.cellForItem(at: indexPath) as! ImageCollectionViewCell
                
            }
        }
    }
    
    
}
