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


// Attribution: http://stackoverflow.com/a/37238705

/**
 * A simple `UICollectionViewFlowLayout` subclass that would make sure the items are center-aligned in the collection view, when scrolling vertically.
 */
class CollectionViewCenterFlowLayout: UICollectionViewFlowLayout {
  
  // MARK: - Object Lifecycle
  
  public convenience init(layout: UICollectionViewFlowLayout) {
    self.init()
    self.itemSize = layout.itemSize
    self.sectionInset = layout.sectionInset
  }
  
  // MARK: - UICollectionViewFlowLayout
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let layoutAttributes = super.layoutAttributesForElements(in: rect) else { return nil }
    let attributes = NSArray(array: layoutAttributes, copyItems: true) as! [UICollectionViewLayoutAttributes]
    guard scrollDirection == .vertical else { return attributes }
    
    var newAttributes: [UICollectionViewLayoutAttributes] = []
    
    /// We will collect items for each row in this array
    var currentRowAttributes: [UICollectionViewLayoutAttributes] = []
    /// We will use this variable to detect new rows when iterating over items
    var yOffset:CGFloat = sectionInset.top
    for attributes in attributes {
      /// If we happen to run into a new row...
      
      if attributes.frame.origin.y != yOffset {
        /*
         * Update layout of all items in the previous row and add them to the resulting array
         */
        centerSingleRowWithItemsAttributes(attributes: &currentRowAttributes, rect: rect)
        newAttributes += currentRowAttributes
        /*
         * Reset the accumulated values for the new row
         */
        currentRowAttributes = []
        yOffset = attributes.frame.origin.y
      }
      currentRowAttributes += [attributes]
    }

    /*
     * Update the layout of the last row.
     */
    centerSingleRowWithItemsAttributes(attributes: &currentRowAttributes, rect: rect)
    newAttributes += currentRowAttributes    
    return newAttributes
  }
  
  /**
   Updates the attributes for items, so that they are center-aligned in the given rect.
   
   - parameter attributes: Attributes of the items
   - parameter rect:       Bounding rect
   */
  private func centerSingleRowWithItemsAttributes(attributes: inout [UICollectionViewLayoutAttributes], rect: CGRect) {
    guard let item = attributes.last else { return }
    
    let itemsCount = CGFloat(attributes.count)
    let sideInsets = rect.width - (item.frame.width * itemsCount) - (minimumInteritemSpacing * (itemsCount - 1))
    var leftOffset = sideInsets / 2
    
    for attribute in attributes {
      attribute.frame.origin.x = leftOffset
      leftOffset += attribute.frame.width + minimumInteritemSpacing
    }
  }
}
