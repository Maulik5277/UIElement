//
//  Part2.swift
//  UITemplet
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part2: UIViewController {
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Bus tickets"
        label.highlightedTextColor = .white
        label.font = .systemFont(ofSize:50)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    private let myTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Source"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return textField
    }()
    private let myTextField1:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Destination"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return textField
    }()
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "sd.png")
        imageView.backgroundColor = .clear
        return imageView
    }()
    private let myDatePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone(secondsFromGMT: 0)
        datePicker.backgroundColor = .white
        datePicker.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        datePicker.addTarget(self, action: #selector(handleDateChange), for: .valueChanged)
        return datePicker
    }()
    private let myStepper:UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.backgroundColor = .white
        stepper.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        stepper.addTarget(self, action: #selector(handleStepper), for: .valueChanged)
        return stepper
    }()
    private let myLabelseat:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .black
        label.textColor = .black
        label.font = .systemFont(ofSize:30)
        return label
    }()
    private let myLabelseat1:UILabel = {
        let label = UILabel()
        label.text = "Seat"
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .black
        label.textColor = .black
        label.font = .systemFont(ofSize:30)
        return label
    }()
    private let mySegmentedControl:UISegmentedControl = {
        let segControl = UISegmentedControl()
        segControl.insertSegment(withTitle: "Male", at: 0, animated: true)
        segControl.insertSegment(withTitle: "Female", at: 1, animated: true)
        //segControl.addTarget(self, action: #selector(), for: .valueChanged)
        segControl.selectedSegmentIndex = 0
        segControl.backgroundColor = .black
        //segControl.font = .systemFont(ofSize:30)
        segControl.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        segControl.tintColor = .black
        return segControl
    }()
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        //        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        button.addTarget(self, action: #selector(MoveToPart3), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        pageControl.addTarget(self, action: #selector(pgctr), for: .valueChanged)
        return pageControl
    }()
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.35, animated: true)
        return progressView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myTextField)
        view.addSubview(myTextField1)
        view.addSubview(myLabel)
        view.addSubview(myImageView)
        view.addSubview(myDatePicker)
        view.addSubview(myStepper)
        view.addSubview(myLabelseat)
        view.addSubview(myLabelseat1)
        view.addSubview(mySegmentedControl)
        view.addSubview(myButton)
        view.addSubview(myPageControl)
        view.addSubview(myProgressView)
        self.view.backgroundColor = .red

        // Do any additional setup after loading the view.
    }
    @objc func MoveToPart3(){
        let vc = Part3()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func handleDateChange() {
        print(myDatePicker.date)
    }
    @objc func handleStepper(){
        print(myStepper.value)
        myLabelseat.text = myStepper.value.description
    }
    @objc func pgctr() {
        print(myPageControl.currentPage)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //let toolBarHeight:CGFloat = view.safeAreaInsets.top + 40
        myLabel.frame = CGRect(x: 40, y: view.height/2-330, width: view.width-80, height: 60)
        myTextField.frame = CGRect(x: 40, y: view.height/2-250, width: view.width-80, height: 60)
          myImageView.frame = CGRect(x: 170, y: view.height/2-190, width: 60, height: 60)
        myTextField1.frame = CGRect(x: 40, y: view.height/2-130, width: view.width-80, height: 60)
        myDatePicker.frame = CGRect(x: 40, y: view.height/2-50, width: view.width-80, height: 60)
        myStepper.frame = CGRect(x: 150, y: view.height/2+46, width: view.width-80, height: 60)
        myLabelseat.frame = CGRect(x: 300, y: view.height/2+30, width: view.width-80, height: 60)
         myLabelseat1.frame = CGRect(x: 40, y: view.height/2+30, width: view.width-80, height: 60)
        mySegmentedControl.frame = CGRect(x: 40, y: view.height/2+100, width: view.width - 80, height: 60)
         myButton.frame = CGRect(x: 40, y: view.height/2+200, width: view.width-80, height: 60)
        myPageControl.frame = CGRect(x: 160, y: view.height/2+300, width: 90, height: 40)
         myProgressView.frame = CGRect(x: 40, y: view.height/2+280, width: view.width-80, height: 60)
    }

}
