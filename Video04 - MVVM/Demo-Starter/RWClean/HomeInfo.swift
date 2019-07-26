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

// MARK: - HomeInfo

public class HomeInfo {
  
  // MARK: - Instance Properties
  public fileprivate(set) var bathroomCount: UInt
  public fileprivate(set) var bedroomCount: UInt
  public fileprivate(set) var kitchenSize: RoomSize
  public fileprivate(set) var otherRoomsCount: UInt
  public fileprivate(set) var squareFootage: UInt
  
  // MARK: - Object Lifecycle
  public init(bathroomCount: UInt,
              bedroomCount: UInt,
              kitchenSize: RoomSize,
              otherRoomsCount: UInt,
              squareFootage: UInt) {
    self.bathroomCount = bathroomCount
    self.bedroomCount = bedroomCount
    self.kitchenSize = kitchenSize
    self.otherRoomsCount = otherRoomsCount
    self.squareFootage = squareFootage
  }
  
  public func copy() -> HomeInfo {
    return HomeInfo(bathroomCount: bathroomCount,
                    bedroomCount: bedroomCount,
                    kitchenSize: kitchenSize,
                    otherRoomsCount: otherRoomsCount,
                    squareFootage: squareFootage)
  }
}

// MARK: - MutableHomeInfo
public class MutableHomeInfo: HomeInfo {
  
  // MARK: - Object Lifecyle
  public convenience init() {
    
    self.init(bathroomCount: 2,
              bedroomCount: 3,
              kitchenSize: .medium,
              otherRoomsCount: 1,
              squareFootage: 2000)
  }
    
  // MARK: - Instance Methods
  public func setBathroomCount(_ count: UInt) {
    bathroomCount = count
  }
  
  public func setBedroomCount(_ count: UInt) {
    bedroomCount = count
  }
  
  public func setKitchenSize(_ roomSize: RoomSize) {
    kitchenSize = roomSize
  }
  
  public func setOtherRoomsCount(_ count: UInt) {
    otherRoomsCount = count
  }
  
  public func setSquareFootage(_ area: UInt) {
    squareFootage = area
  }
}
