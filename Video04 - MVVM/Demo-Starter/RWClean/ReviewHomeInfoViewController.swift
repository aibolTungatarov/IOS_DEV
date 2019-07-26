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

// MARK: - ReviewHomeInfoViewController
public class ReviewHomeInfoViewController: HomeInfoViewController {
  
  // MARK: - Instance Properties
  internal var staticTableViewController: ReviewHomeInfoStaticTableViewController!
  
  // MARK: - View Lifecycle
  public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    if let viewController = segue.destination as? ReviewHomeInfoStaticTableViewController {
      staticTableViewController = viewController
      staticTableViewController.homeInfo = homeInfo
    } else {
      // TODO: - Write this...
    }
  }
  
  // MARK: - Actions
  @IBAction internal func doneButtonPressed(_ sender: Any) {
    showLoadingHUD()
    // TODO: - Write this...
  }
}

// MARK: - ReviewHomeInfoStaticTableViewController
internal class ReviewHomeInfoStaticTableViewController: UITableViewController {
  
  // MARK: - Injections
  internal var homeInfo: MutableHomeInfo! {
    didSet {
      updateHomeInfoLabels()
    }
  }
  
  // MARK: - Instance Properties
  internal lazy var numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    return numberFormatter
  }()
  
  // MARK: - Outlets
  @IBOutlet internal var bathroomCountLabel: UILabel!
  @IBOutlet internal var bedRoomCountLabel: UILabel!
  @IBOutlet internal var otherRoomCountLabel: UILabel!
  @IBOutlet internal var kitchenSizeLabel: UILabel!
  @IBOutlet internal var squareFootageLabel: UILabel!
  
  // MARK: - View Lifecycle
  internal override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    updateHomeInfoLabels()
  }
  
  private func configureTableView() {
    tableView.tableFooterView = UIView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    updateHomeInfoLabels()
  }
  
  internal func updateHomeInfoLabels() {
    guard isViewLoaded else { return }
    bathroomCountLabel.text = "\(homeInfo.bathroomCount)"
    bedRoomCountLabel.text = "\(homeInfo.bedroomCount)"
    otherRoomCountLabel.text = "\(homeInfo.otherRoomsCount)"
    kitchenSizeLabel.text = "\(homeInfo.kitchenSize.displayTitle)"
    squareFootageLabel.text = numberFormatter.string(from: homeInfo.squareFootage as NSNumber)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    parent?.prepare(for: segue, sender: sender)
  }
}
