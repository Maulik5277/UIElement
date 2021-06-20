//
//  ViewController.swift
//  UITemplet
//
//  Created by DCS on 18/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let myLabelfname:UILabel = {
        let label = UILabel()
        label.text = "Enter Your FullName"
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        //        label.font = UIFont(name: "Comic Sans MS", size : 110.00)
        return label
    }()
    private let myLabeladdress:UILabel = {
        let label = UILabel()
        label.text = "Enter Your Address"
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        //        label.font = UIFont(name: "Comic Sans MS", size : 110.00)
        return label
    }()
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(MoveToDtl), for: .touchUpInside)
        return button
    }()
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:40)
        return label
    }()
    private let myTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Address"
        textView.textAlignment = .center
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.font = .systemFont(ofSize:20)
        return textView
    }()
    private let myLabelG:UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        return label
    }()
    private let mySegmentedControl:UISegmentedControl = {
        let segControl = UISegmentedControl()
        segControl.insertSegment(withTitle: "Male", at: 0, animated: true)
        segControl.insertSegment(withTitle: "Female", at: 1, animated: true)
        segControl.selectedSegmentIndex = 0
        segControl.backgroundColor = .white
        segControl.addTarget(self, action: #selector(handleSegmentedControl), for: .valueChanged)
        return segControl
    }()
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pgctr), for: .valueChanged)
        return pageControl
    }()
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.0, animated: true)
        return progressView
    }()
    private let myTextFieldFname:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Full Name"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.font = .systemFont(ofSize:20)
        return textField
    }()
    @objc func handleSegmentedControl() {
        print(mySegmentedControl.selectedSegmentIndex)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myButton)
        view.addSubview(myTextFieldFname)
        view.addSubview(myTextView)
        view.addSubview(myLabel)
        view.addSubview(myLabelfname)
        view.addSubview(myLabeladdress)
        view.addSubview(myPageControl)
        view.addSubview(myProgressView)
        view.addSubview(mySegmentedControl)
        view.addSubview(myLabelG)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bck-2.jpg")!)
    }
    @objc private func MoveToDtl() {
        print("next page->details")
        let vc = Detalis()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func pgctr() {
        print(myPageControl.currentPage)
        //        let vc = AddressVC()
        //        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myLabelfname.frame = CGRect(x: 40, y: 160, width: view.width-80, height: 60)
        myLabeladdress.frame = CGRect(x: 40, y: 275, width: view.width-80, height: 60)
        myTextFieldFname.frame = CGRect(x: 40, y: view.height/2-120, width: view.width-80, height: 60)
        myProgressView.frame = CGRect(x: 40, y: view.height/2+280, width: view.width-80, height: 60)
        myTextView.frame = CGRect(x: 40, y: view.height/2-5, width: view.width-80, height: 60)
        myButton.frame = CGRect(x: 40, y: view.height/2+130, width: view.width-80, height: 60)
        myLabelG.frame = CGRect(x: 40, y: view.height/2+70, width: view.width-80, height: 60)
        mySegmentedControl.frame = CGRect(x: 130, y: view.height/2+80, width: view.width-185, height: 30)
        myLabel.frame = CGRect(x: 40, y: 100, width: view.width-80, height: 60)
        myPageControl.frame = CGRect(x: 40, y: view.height/2+200, width: view.width-80, height: 60)
    }
    
    
}

