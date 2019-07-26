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

// MARK: - WelcomeViewControllerDelegate
public protocol WelcomeViewControllerDelegate: class {
  func welcomeViewControllerDonePressed(_ controller: WelcomeViewController)
}

// MARK: - WelcomeViewController
public class WelcomeViewController: UIViewController {
  
   // MARK: - Injections
  public var delegate: WelcomeViewControllerDelegate?
  
  // MARK: - Instance Properties
  internal let imageNames: [String] = ["mop", "toothbrushing_frog", "towels"]
  internal var index = 0
  internal var timer: Timer?
  
  // MARK: - Outlets
  @IBOutlet internal var imageView: UIImageView!
  
  // MARK: - View Lifecycle
  public override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    timer = Timer.scheduledTimer(timeInterval: 5.0, target: self,
                                 selector: #selector(updateImageView(_:)),
                                 userInfo: nil, repeats: true)
  }
  
  public override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    timer?.invalidate()
  }
  
  internal func updateImageView(_ timer: Timer) {
    index = (index + 1) < imageNames.count ? (index + 1) : 0
    imageView.image = UIImage(named: imageNames[index],
                              in: Bundle(for: type(of: self)),
                              compatibleWith: nil)
  }
    
  // MARK: - Actions
  @IBAction func doneButtonPressed(_ sender: Any) {
    delegate?.welcomeViewControllerDonePressed(self)
  }  
}
