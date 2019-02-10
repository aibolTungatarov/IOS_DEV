//
//  ViewController.swift
//  WeatherApplication
//
//  Created by Mac Pro on 2/9/19.
//  Copyright © 2019 Mac Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchBar.delegate = self;
    }
}
extension ViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder();
        let urlString = "https://api.apixu.com/v1/current.json?key=9e8307961b524f4597081714190902&q=\(searchBar.text!.replacingOccurrences(of: " ", with: "%20"))"
        var locationName: String?
        var locationTemp: Double?
        let Url = URL(string: urlString)
        let task = URLSession.shared.dataTask(with: Url!) { (data, response, error) in
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                if json["error"] != nil{
                    DispatchQueue.main.async {
                        self.townLabel.text = "Error Has Occured"
                        self.tempLabel.text = ""
                    }
                }
                else{
                    if let location = json["location"]{
                        locationName = location["name"]! as? String
                    }
                    if let current = json["current"]{
                        locationTemp = current["temp_c"]! as? Double
                    }
                    DispatchQueue.main.async {
                        self.tempLabel.text = "\(locationTemp!)"
                        self.townLabel.text = locationName!
                    }
                }
            }
            catch let error {
                print(error)
            }
        }
        task.resume()
    }
}

