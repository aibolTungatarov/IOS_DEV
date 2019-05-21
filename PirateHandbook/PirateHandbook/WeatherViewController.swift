//
//  WeatherViewController.swift
//  PirateHandbook
//
//  Created by Aibol Tungatarov on 5/13/19.
//  Copyright © 2019 aibolProd. All rights reserved.
//

import UIKit

class WeatherViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let images = [#imageLiteral(resourceName: "weather-cloudy"), #imageLiteral(resourceName: "weather-sun"), #imageLiteral(resourceName: "weather-rain")]
        
        let imageViews: [UIImageView] = images.map {
            image in
            let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
            
        }
        
        let spacerGuides = (0..<images.count).map { _ in UILayoutGuide()}
        
        let containerGuide = UILayoutGuide()
        imageViews.forEach(view.addSubview)
        spacerGuides.forEach(view.addLayoutGuide)
        
        view.addLayoutGuide(containerGuide)
    }
    

}
