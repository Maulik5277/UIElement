//
//  ViewController.swift
//  UITemplet
//
//  Created by DCS on 18/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Bus Booking"
        label.highlightedTextColor = .white
        label.font = .systemFont(ofSize:50)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    private let myLabel1:UILabel = {
        let label = UILabel()
        label.text = "Safe Travel with Us!!"
        label.highlightedTextColor = .white
        label.font = .systemFont(ofSize:30)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
  
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "logo3.png")
        imageView.backgroundColor = .clear
        return imageView
    }()
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Let's Book", for: .normal)
//        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        button.addTarget(self, action: #selector(MoveToPart2), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myLabel)
        view.addSubview(myImageView)
        view.addSubview(myButton)
        view.addSubview(myLabel1)
        self.view.backgroundColor = .red
    }
    @objc func MoveToPart2(){
        let vc = Part2()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        myLabel.frame = CGRect(x: 40, y: view.height/2-300, width: view.width-80, height: 60)
        myImageView.frame = CGRect(x: 40, y: view.height/2-200, width: view.width-80, height: 180)
        myLabel1.frame = CGRect(x: 40, y: view.height/2+40, width: view.width-80, height: 60)
        myButton.frame = CGRect(x: 40, y: view.height/2+200, width: view.width-80, height: 60)
    }
}

