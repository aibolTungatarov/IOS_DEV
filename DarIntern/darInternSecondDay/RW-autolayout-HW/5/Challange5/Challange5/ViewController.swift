//
//  ViewController.swift
//  Challange5
//
//  Created by Aibol Tungatarov on 7/15/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animeTitleValueLabel: UILabel!
    @IBOutlet weak var animeTitleLabel: UILabel!
    @IBOutlet weak var authorValueLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var segOutlet: UISegmentedControl!
    @IBOutlet weak var seriesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func segClicked(_ sender: Any) {
        var lang: String?
        if (segOutlet.selectedSegmentIndex == 0){
            lang = "es"
        }
        else if (segOutlet.selectedSegmentIndex == 1){
            lang = "en"
        }
        else if (segOutlet.selectedSegmentIndex == 2){
            lang = "ru"
        }
        animeTitleLabel.text = "animeTitle".localizableString(loc: lang!)
        animeTitleValueLabel.text = "animeTitleAnswer".localizableString(loc: lang!)
        authorLabel.text = "author".localizableString(loc: lang!)
        authorValueLabel.text = "authorAnswer".localizableString(loc: lang!)
        dateLabel.text = "date".localizableString(loc: lang!)
        seriesLabel.text = "series".localizableString(loc: lang!)
    }
    

}

extension String {
    func localizableString(loc: String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

