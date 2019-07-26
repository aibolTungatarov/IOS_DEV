/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

public class ProductsViewController: UIViewController {
  
  // MARK: - Injections
  internal var networkClient = NetworkClient.shared
  
  internal var productType: Product.ProductType! {
    didSet {
      title = productType.title
    }
  }
  
  // MARK: - Instance Properties
  internal var productViewModels: [ProductViewModel] = []
  
  // MARK: - Outlets
  @IBOutlet internal var collectionView: UICollectionView! {
    didSet {
      let refreshControl = UIRefreshControl()
      refreshControl.addTarget(self,
                               action: #selector(loadProducts),
                               for: .valueChanged)
      collectionView.refreshControl = refreshControl
      let layout = collectionView.collectionViewLayout
        as! UICollectionViewFlowLayout
      collectionView.collectionViewLayout =
        CollectionViewCenterFlowLayout(layout: layout)
    }
  }
  
  internal func loadProducts() {
    collectionView.refreshControl?.beginRefreshing()
    networkClient.getProducts(
      forType: productType,
      success: { [weak self] products in
        guard let strongSelf = self else { return }
        strongSelf.productViewModels = products.map { ProductViewModel(product: $0) }
        strongSelf.collectionView.reloadData()
        strongSelf.collectionView.refreshControl?.endRefreshing()
        
        
      }, failure: { [weak self] error in
        print("Product download failed: \(error)")
        guard let strongSelf = self else { return }
        strongSelf.collectionView.refreshControl?.endRefreshing()
    })
  }
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    loadProducts()
  }
  
  public override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    guard let selectedItem = collectionView.indexPathsForSelectedItems
      else { return }
    selectedItem.forEach { collectionView.deselectItem(
      at: $0, animated: false)
    }
  }
  
  // MARK: - Segue
  public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let viewController = segue.destination
      as? ProductDetailsViewController else { return }
    let indexPath = collectionView.indexPathsForSelectedItems!.first!
    viewController.productViewModel = productViewModels[indexPath.row]
  }
}

// MARK: - UICollectionViewDataSource
extension ProductsViewController: UICollectionViewDataSource {
  
  public func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
    return productViewModels.count
  }
  
  public func collectionView(_ collectionView: UICollectionView,
                             cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellIdentifier = "ProductCell"
    let productViewModel = productViewModels[indexPath.row]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                  for: indexPath) as! ProductCollectionViewCell
    productViewModel.configure(cell)
    return cell
  }
}
