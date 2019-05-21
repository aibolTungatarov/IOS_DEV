//
//  DetailViewController.swift
//  CollectionViews
//
//  Created by Aibol Tungatarov on 5/20/19.
//  Copyright © 2019 aibolProd. All rights reserved.
//

import UIKit

class DetailViewController: ViewController {
    @IBOutlet weak var detailsLabel: UILabel!
    var string: String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsLabel.text = string
    }

}
