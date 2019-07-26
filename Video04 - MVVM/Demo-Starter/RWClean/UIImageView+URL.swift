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

extension UIImageView {
  
  // MARK: - Constants
  private struct AssociationKey {
    static var dataTask = "rw_dataTask"
    static var session = "rw_imageDownloadSession"
  }
  
  // MARK: - Static Properties
  public static let imageDownloader = URLSession(configuration: .default)
  
  // MARK: - Instance Properties
  public var dataTask: URLSessionDataTask? {
    get {
      return objc_getAssociatedObject(self, &AssociationKey.dataTask) as? URLSessionDataTask
      
    } set {
      dataTask?.cancel()
      objc_setAssociatedObject(self, &AssociationKey.dataTask, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
  
  // MARK: - Instance Methods
  @discardableResult public func rw_setImage(url: URL?) -> URLSessionDataTask? {
    guard let url = url else {
      self.dataTask = nil
      image = nil
      return nil
    }
    let dataTask = UIImageView.imageDownloader.dataTask(
      with: url, completionHandler: { [weak self] (data, response, error) in
        guard let strongSelf = self else { return }
        guard let data = data, let image = UIImage(data: data) else {
          print("Image download failed: \(String(describing: error))")
          strongSelf.image = nil
          return
        }
        DispatchQueue.main.async { [weak self] in
          guard let strongSelf = self else { return }
          strongSelf.image = image
        }
    })
    dataTask.resume()
    self.dataTask = dataTask
    return dataTask
  }
}
