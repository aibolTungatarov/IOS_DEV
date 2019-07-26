import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButtonOutlet: UIBarButtonItem!
    @IBOutlet private weak var collectionView: UICollectionView!

    @IBOutlet weak var trashBtnOutlet: UIBarButtonItem!
    var collectionData = ["1🏆" , "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻",
                        "8 🍖", "9 🎸", "10 🐯", "11 🐷", "12 🌋"]

  @IBAction func addItem() {
    collectionView.performBatchUpdates({
      for _ in 0 ..< 2 {
        let text = "\(collectionData.count + 1) 😸"
        collectionData.append(text)
        let indexPath = IndexPath(row: collectionData.count - 1, section: 0)
        collectionView.insertItems(at: [indexPath])
      }
    }, completion: nil)
  }
  @IBAction func trashBtnClicked(_ sender: Any) {
    if let indexPaths = collectionView.indexPathsForSelectedItems {
        let items = indexPaths.map{ $0.item }.sorted().reversed()
        for item in items {
            collectionData.remove(at: item)
        }
        collectionView.deleteItems(at: indexPaths)
        navigationController?.isToolbarHidden = true
    }
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let width = (view.frame.size.width - 20) / 3
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: width, height: width)
    
    let refresh = UIRefreshControl()
    refresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
    collectionView.refreshControl = refresh
    
    navigationItem.leftBarButtonItem = editButtonItem
    navigationController?.isToolbarHidden = true
  }

  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    addButtonOutlet.isEnabled = !isEditing
    trashBtnOutlet.isEnabled = isEditing
    collectionView.allowsMultipleSelection = true
    collectionView.indexPathsForSelectedItems?.forEach {
        collectionView.deselectItem(at: $0, animated: false)
    }
    let indexPaths = collectionView.indexPathsForVisibleItems
    for indexPath in indexPaths {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.isEditing = editing
    }
    if !editing {
        navigationController?.isToolbarHidden = true
    }
    
  }

  @objc func refresh() {
    addItem()
    collectionView.refreshControl?.endRefreshing()
  }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return collectionData.count
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
    cell.titleLabel.text = collectionData[indexPath.row]
    cell.isEditing = isEditing
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if !isEditing {
        performSegue(withIdentifier: "DetailSegue", sender: indexPath)
        
    }
    else {
        navigationController?.isToolbarHidden = false
    }
  }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let indexPaths = collectionView.indexPathsForSelectedItems, indexPaths.count == 0 {
            navigationController?.isToolbarHidden = true
        }
    }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  
    if segue.identifier == "DetailSegue" {
      if let dest = segue.destination as? DetailViewController, let index = sender as? IndexPath {
      
        dest.selection = collectionData[index.row]
      }
    }
  
  }
  
  
}

