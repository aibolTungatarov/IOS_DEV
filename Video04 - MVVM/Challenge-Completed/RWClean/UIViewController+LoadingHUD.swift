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


extension UIViewController {
  
  private struct AssociationKey {
    static var loadingHUD = "rw_loadingHUD"
  }
  
  public var loadingHUD: UIView? {
    get {
      return objc_getAssociatedObject(self, &AssociationKey.loadingHUD) as? UIView
    } set {
      objc_setAssociatedObject(self, &AssociationKey.loadingHUD, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  public func showLoadingHUD(_ animated: Bool = true) {
    
    guard self.loadingHUD == nil else { return }
    view.isUserInteractionEnabled = false
    
    let loadingHUD = LoadingHUD.instanceFromNib()
    self.loadingHUD = loadingHUD
    view.addSubview(loadingHUD)
    
    loadingHUD.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin]
    loadingHUD.frame.origin.x = (view.frame.width - loadingHUD.frame.width) / 2
    loadingHUD.frame.origin.y = (view.frame.height - loadingHUD.frame.height) / 2
    
    guard animated else { return }
    
    loadingHUD.alpha = 0.0
    UIView.animate(withDuration: 0.33) {
      loadingHUD.alpha = 1.0
    }
  }
  
  public func dismissLoadingHUD(_ animated: Bool = true) {
    
    guard let loadingHUD = loadingHUD else { return }
    view.isUserInteractionEnabled = true
    
    let closure: (Bool) -> Void = { [weak self] _ in
      guard let strongSelf = self else { return }
      loadingHUD.removeFromSuperview()
      strongSelf.loadingHUD = nil
    }
    guard animated else {
      closure(true)
      return
    }
    UIView.animate(withDuration: 0.33, animations: {
      loadingHUD.alpha = 0.0      
    }, completion: closure)
  }
}
