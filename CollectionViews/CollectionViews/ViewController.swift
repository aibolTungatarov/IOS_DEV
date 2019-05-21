//
//  ViewController.swift
//  CollectionViews
//
//  Created by Aibol Tungatarov on 5/13/19.
//  Copyright © 2019 aibolProd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet private weak var collectionView: UICollectionView!
    
    @IBOutlet weak var addItemOutlet: UIBarButtonItem!
    var data = ["1👽", "2👽", "3👽", "4👽", "5👽"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = (view.frame.size.width - 20) / 3
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: width, height: width)
        }
        navigationItem.leftBarButtonItem = editButtonItem
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        addItemOutlet.isEnabled = !isEditing
        setEditing(editing, animated: true)
    }
    
    @IBAction func addItem(_ sender: Any) {
        let text = "\(data.count + 1)😎"
        data.append(text)
        let indexPaths = [IndexPath(row: data.count - 1, section: 0)]
        collectionView.insertItems(at: indexPaths)
    }
    

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailSegue", sender: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        if let label = cell.viewWithTag(100) as? UILabel {
            label.text = data[indexPath.row]
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            if let dest = segue.destination as? DetailViewController, let indexPath = sender as? IndexPath {
                dest.string = data[indexPath.row]
            }
        }
    }
    
    
}

