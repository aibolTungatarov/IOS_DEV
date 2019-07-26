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

@objc public protocol ProductViewModelView {
  @objc optional var productDescriptionLabel: UILabel { get }
  @objc optional var productImageView: UIImageView { get }
  @objc optional var productPriceLabel: UILabel { get }
  @objc optional var productTitleLabel: UILabel { get }
}

public final class ProductViewModel {
  
  // MARK: - Static Properties
  internal static let numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.locale = Locale(identifier: "en_US")
    numberFormatter.numberStyle = .currency
    return numberFormatter
  }()
  
  // MARK: - Instance Properties
  public let product: Product
  
  public let descriptionText: String
  public let imageURL: URL?
  public let priceText: String
  public let titleText: String
  
  // MARK: - Object Lifecycle
  public init(product: Product) {
    self.product = product
    
    descriptionText = product.productDescription
    imageURL = product.imageURL
    
    if product.priceHourly > 0 {
      let price = ProductViewModel.numberFormatter.string(from: product.priceHourly as NSNumber)!
      priceText = "Only \(price) / hour"
    } else if product.priceSquareFoot > 0 {
      let price500SquareFoot = product.priceSquareFoot * 500
      let price = ProductViewModel.numberFormatter.string(from: price500SquareFoot as NSNumber)!
      priceText = "\(price) / 500 ft²"
    } else {
      priceText = "Contact Us for Pricing"
    }
    titleText = product.title
  }
}

extension ProductViewModel {
  
  public func configure(_ view: ProductViewModelView) {
    _ = view.productImageView?.rw_setImage(url: imageURL)
    view.productPriceLabel?.text = priceText
    view.productDescriptionLabel?.text = descriptionText
    view.productTitleLabel?.text = titleText
  }
}
