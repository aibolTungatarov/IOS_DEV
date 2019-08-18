//
//  DataManager.swift
//  serverRequest
//
//  Created by Aibol Tungatarov on 8/1/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataManager: NSObject {
    static let shared = DataManager()
    private override init() {}
    
    func requestBooks(_ bookTitle: String, completion: @escaping(JSON) -> ()) {
        
        let url = "https://www.googleapis.com/books/v1/volumes?q=\(bookTitle)"
        Alamofire.request(url).responseJSON { response in
            
            if let json = response.result.value {
                var swifrtyjson = JSON(response.result.value)
                completion(swifrtyjson)
            }
        }
    }
}
