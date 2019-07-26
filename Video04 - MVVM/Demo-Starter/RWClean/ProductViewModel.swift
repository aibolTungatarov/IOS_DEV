//
//  ProductViewModel.swift
//  RWClean
//
//  Created by Aibol Tungatarov on 7/19/19.
//  Copyright © 2019 Razeware, LLC. All rights reserved.
//

import Foundation

public class ProductViewModel {
    
    // MARK: - Instantce propereties
    public var product: Product!
    
    internal static let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }()
    
    public var descriptionText: String
    public var imageURL: URL?
    public var priceText: String
    public var titleText: String
    
    public init(product: Product) {
        self.descriptionText = product.productDescription
        self.imageURL = product.imageURL
    
        if product.priceHourly > 0 {
            let price = ProductViewModel.numberFormatter.string(from: product.priceHourly as NSNumber)!
            priceText = "Only \(price) / hour"
            
        } else if product.priceSquareFoot > 0 {
            let price500SqFt = product.priceSquareFoot * 500
            let price = ProductViewModel.numberFormatter.string(from: price500SqFt as NSNumber)!
            priceText = "\(price) / 500 ft²"
        } else {
            priceText = "Contact Us For Pricing"
        }
        descriptionText = product.productDescription
        
        self.titleText = product.title
        
        
    }
    
    
}
