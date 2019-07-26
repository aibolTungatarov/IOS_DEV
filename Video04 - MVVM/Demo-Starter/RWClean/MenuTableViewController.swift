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

public class MenuTableViewController: UITableViewController {
  
  // MARK: - View Lifecycle
  public override func viewDidLoad() {
    super.viewDidLoad()
    configureBackButton()
    configureTableView()
  }
  
  private func configureBackButton() {
    let image = UIImage(named: "menu")!
    let backButton = UIBarButtonItem(image: image, style: .done, target: nil, action: nil)
    navigationItem.backBarButtonItem = backButton
    navigationItem.backBarButtonItem = backButton
  }
  
  private func configureTableView() {
    tableView.tableFooterView = UIView()
  }
  
  // MARK: - UITableViewDelegate
  private struct CellIdentifiers  {
    static let products = "ProductsCell"
    static let homeInfo = "HomeInfoCell"
  }
  
  public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let cellIdentifier = tableView.cellForRow(at: indexPath)?.reuseIdentifier else { return }
    switch cellIdentifier {
    case CellIdentifiers.products: showCleaningServicesController()
    case CellIdentifiers.homeInfo: showHomeInfoController()
    default: break
    }
  }
  
  fileprivate func showCleaningServicesController() {
    let viewController = CleaningServicesBuilder.instantiateNavigationController()
    splitViewController!.showDetailViewController(viewController, sender: nil)
  }
  
  fileprivate func showHomeInfoController() {    
    let viewController = HomeInfoBuilder.instantiateNavigationController(delegate: self)
    splitViewController!.showDetailViewController(viewController, sender: nil)
  }
}

// MARK: - HomeInfoBuilderDelegate
extension MenuTableViewController: HomeInfoBuilderDelegate {
    
  public func homeInfoBuilderCompleted(_ homeInfo: HomeInfo) {    
    navigationController?.viewControllers = [self]
    showCleaningServicesController()
  }
}
