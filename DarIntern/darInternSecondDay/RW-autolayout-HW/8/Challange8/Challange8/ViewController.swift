//
//  ViewController.swift
//  Challange8
//
//  Created by Aibol Tungatarov on 7/16/19.
//  Copyright © 2019 Aibol Production. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "strongestPirate")
        return imageView
    }()
    let animeTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    let animeTitleAnswerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    let authorLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    let authorAnswerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    let dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    let dateAnswerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    let seriesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    let seriesAnswerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
//    let bottomStackView: UIStackView = {
//        let stackView = UIStackView()
//        return stackView
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(topView)
        view.addSubview(bottomView)
        
        //top
        topView.addSubview(topImageView)
        
        //bottom
//        bottomView.addSubview(bottomStackView)
//        bottomStackView.addSubview(animeTitleLabel)
//        bottomStackView.addSubview(animeTitleAnswerLabel)
//        bottomStackView.addSubview(authorLabel)
//        bottomStackView.addSubview(authorAnswerLabel)
//        bottomStackView.addSubview(dateLabel)
//        bottomStackView.addSubview(dateAnswerLabel)
//        bottomStackView.addSubview(seriesLabel)
//        bottomStackView.addSubview(seriesAnswerLabel)
        
        var allConstraints = [NSLayoutConstraint]()
        //constraints for topView and bottomView EQUAL HEIGHTS
        topView.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        let equalHeights = NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0][v1(==v0)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":topView,"v1":bottomView])
        allConstraints += equalHeights
        
//        let NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]-[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":topView,"v1":bottomView])
//        allConstraints += equalHeights
        
        let hrTopView = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":topView])
        allConstraints += hrTopView
        
        let hrBottomView = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":bottomView])
        allConstraints += hrBottomView
        
        // topImageView
        let hrConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-80-[v0]-80-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": topImageView])
        allConstraints += hrConstraint
        
        let vrConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|-50-[v0]-50-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": topImageView])
        allConstraints += vrConstraint
        
        
        NSLayoutConstraint.activate(allConstraints)
        
        
        
        
        
    }


}

