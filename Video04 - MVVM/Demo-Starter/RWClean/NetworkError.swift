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

public enum NetworkError: Error {
  
  case notAuthenticated
  case forbidden
  case notFound
  
  case networkProblem(Error)
  case unknown(HTTPURLResponse?)
  case userCancelled
  
  public init(error: Error) {
    self = .networkProblem(error)
  }
  
  public init(response: URLResponse?) {
    guard let response = response as? HTTPURLResponse else {
      self = .unknown(nil)
      return
    }
    switch response.statusCode {
    case NetworkError.notAuthenticated.statusCode: self = .notAuthenticated
    case NetworkError.forbidden.statusCode: self = .forbidden
    case NetworkError.notFound.statusCode: self = .notFound
    default: self = .unknown(response)
    }
  }
  
  public var isAuthError: Bool {
    switch self {
    case .notAuthenticated: return true
    default: return false
    }
  }
  
  public var statusCode: Int {
    switch self {
    case .notAuthenticated: return 401
    case .forbidden:        return 403
    case .notFound:         return 404
      
    case .networkProblem(_): return 10001
    case .unknown(_):        return 10002
    case .userCancelled(_):  return 99999
    }
  }
}

// MARK: - Equatable
extension NetworkError: Equatable {
  public static func ==(lhs: NetworkError, rhs: NetworkError) -> Bool {
    return lhs.statusCode == rhs.statusCode
  }
}
