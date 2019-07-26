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

import Foundation

public final class Product {
  
  // MARK: - Constants
  public enum ProductType: String {
    case business
    case home
    
    public var title: String {
      switch self {
      case .business:
        return NSLocalizedString("Business", comment: "")
      case .home:
        return NSLocalizedString("Home", comment: "")
      }
    }
  }
  
  internal struct Keys {
    static let id = "id"
    static let imageURL = "image_url"
    static let priceHourly = "price_hourly"
    static let priceSquareFoot = "price_square_foot"
    static let productDescription = "product_description"
    static let title = "title"
    static let type = "type"
  }
  
  internal static var tableName = "products"
  
  // MARK: - Instance Properties
  public let identifier: Int?
  public let imageURL: URL?
  public let priceHourly: Double
  public let priceSquareFoot: Double
  public let productDescription: String
  public let title: String
  public let type: ProductType
  
  // MARK: - Object Lifecycle
  public init?(json: [String: Any]) {
    
    let imageURL: URL?
    
    if let imageURLString = json[Keys.imageURL] as? String {
      imageURL = URL(string: imageURLString)
      
    } else {
      imageURL = nil
    }
    
    guard let identifier = json[Keys.id] as? Int,
      let priceHourly = json[Keys.priceHourly] as? Double,
      let priceSquareFoot = json[Keys.priceSquareFoot] as? Double,
      let productDescription = json[Keys.productDescription] as? String,
      let title = json[Keys.title] as? String,
      let rawType = json[Keys.type] as? String,
      let type = ProductType(rawValue: rawType) else {
        return nil
    }
    self.identifier = identifier
    self.imageURL = imageURL
    self.priceHourly = priceHourly
    self.priceSquareFoot = priceSquareFoot
    self.productDescription = productDescription
    self.title = title
    self.type = type
  }
  
  public init(imageURL: URL?,
              priceHourly: Double,
              priceSquareFoot: Double,
              productDescription: String,
              title: String,
              type: ProductType) {
    
    self.identifier = nil
    self.imageURL = imageURL
    self.priceHourly = priceHourly
    self.priceSquareFoot = priceSquareFoot
    self.productDescription = productDescription
    self.title = title
    self.type = type
  }
  
  // MARK: - Class Constructors
  public class func array(jsonArray: [[String: Any]]) -> [Product] {
    var array: [Product] = []
    for json in jsonArray {
      guard let product = Product(json: json) else { continue }
      array.append(product)
    }
    return array
  }
}
