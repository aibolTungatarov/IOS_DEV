//
//  ViewController.swift
//  Lecture4Week2(Second part)
//
//  Created by Aibol Tungatarov on 7/18/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let headerId = "headerId"
    let cellId = "cellId"
    var settingsCellList:[SettingTableViewCell] = []
    let tableView: UITableView = {
        let t = UITableView(frame: .zero, style: .grouped)
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        setupViews()
        makeConstraints()
        
    }
    
    func setupViews() {
        view.addSubview(tableView)
        
    }
    
    func makeConstraints() {
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.delegate = self
        tableView.dataSource = self
        

    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 0
        }
        else if section == 2 {
            return 2
        }
        else if section == 3 {
            return 1
        }
        else if section == 4 {
            return 6
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    
}


class SettingTableViewCell: UITableViewCell {
    let contactImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "placeholder")
        return iv
    }()
    let contactTitlelabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Aibol"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let btn: UIButton = {
        let btn = UIButton(type: .detailDisclosure)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(contactImageView)
        addSubview(contactTitlelabel)
        addSubview(btn)
        contactImageView.snp.makeConstraints { (make) -> Void in
            make.leftMargin.equalToSuperview()
            make.topMargin.equalToSuperview()
            make.bottomMargin.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        contactTitlelabel.snp.makeConstraints { (make) -> Void in
            make.leftMargin.equalTo(contactImageView.snp.right).offset(20)
            make.topMargin.equalToSuperview()
            make.bottomMargin.equalToSuperview()
            make.rightMargin.equalTo(btn.snp.left)
        }
        btn.snp.makeConstraints { (make) -> Void in
            make.topMargin.equalToSuperview()
            make.bottomMargin.equalToSuperview()
            make.rightMargin.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
