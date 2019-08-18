//
//  ViewController.swift
//  serverRequest
//
//  Created by Aibol Tungatarov on 8/1/19.
//  Copyright © 2019 Aibol Tungatarov. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON

class ViewController: UIViewController {

    let cellId = "cellId"
    var books: [String: Any] = [:]
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        createConstraints()
        DataManager.shared.requestBooks("Swift") { (json) in
            print(json["items"][0])
            for book in json["items"] {
                
            }
            self.tableView.reloadData()
        }
    }
    
    func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 400
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        view.addSubview(tableView)
    }
    
    func createConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//        let book = JSON(books[indexPath.row])
//        print(book)
        cell.backgroundColor = .red
        return cell
    }
}

