//
//  Detalis.swift
//  UITemplet
//
//  Created by DCS on 19/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit
class Detalis: UIViewController {
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Select Your Birthdate"
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        //        label.font = UIFont(name: "Comic Sans MS", size : 110.00)
        return label
    }()
    private let myLabelcountry:UILabel = {
        let label = UILabel()
        label.text = "Select Your Country"
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        //        label.font = UIFont(name: "Comic Sans MS", size : 110.00)
        return label
    }()
    private let myDatePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone(secondsFromGMT: 0)
        datePicker.backgroundColor = .white
        datePicker.addTarget(self, action: #selector(handleDateChange), for: .valueChanged)
        return datePicker
    }()
    
    private let myPickerView = UIPickerView()
    private let pickerData = ["New York","Rush","UK","Austerliya"]
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.addTarget(self, action: #selector(MoveToDtl2), for: .touchUpInside)
        button.backgroundColor = .blue
        return button
    }()
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 1
        pageControl.addTarget(self, action: #selector(pgctr), for: .valueChanged)
        return pageControl
    }()
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.35, animated: true)
        return progressView
    }()
    private let myLabelStepper:UILabel = {
        let label = UILabel()
        label.text = "0.0"
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        return label
    }()
    private let myStepper:UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.backgroundColor = .white
        stepper.addTarget(self, action: #selector(handleStepper), for: .valueChanged)
        return stepper
    }()
    private let myLabelExpe:UILabel = {
        let label = UILabel()
        label.text = "Experince"
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        return label
    }()
    private let myLabelLvl:UILabel = {
        let label = UILabel()
        label.text = "Choice Your Skill"
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        return label
    }()
    private let mySlider:UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 3
        slider.addTarget(self, action: #selector(handleSlider), for: .valueChanged)
        return slider
    }()
    private let myLabelSlider:UILabel = {
        let label = UILabel()
        label.text = ""
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myButton)
        view.addSubview(myPageControl)
        view.addSubview(myLabel)
        view.addSubview(myDatePicker)
        view.addSubview(myProgressView)
        view.addSubview(myPickerView)
        view.addSubview(myStepper)
        view.addSubview(myLabelStepper)
        view.addSubview(myLabelExpe)
        view.addSubview(mySlider)
        view.addSubview(myLabelSlider)
        view.addSubview(myLabelLvl)
        view.addSubview(myLabelcountry)
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.backgroundColor = .white
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bck-2.jpg")!)
    }
    @objc func handleStepper(){
        print(myStepper.value)
        myLabelStepper.text = myStepper.value.description
    }
    @objc func handleSlider() {
        print(mySlider.value)
        if(mySlider.value == 0.0 || mySlider.value >= 1.0)
        {
            myLabelSlider.text = "Reading"
        }
        if(mySlider.value == 1.0 || mySlider.value >= 2.0)
        {
            myLabelSlider.text = "Reading-Writing"
        }
        if(mySlider.value == 2.0 || mySlider.value >= 3.0)
        {
            myLabelSlider.text = "Reading-Writing-Speaking"
        }
    }
    @objc func handleDateChange() {
        print(myDatePicker.date)
    }
   
    @objc func MoveToDtl2(){
        let vc = Detalis2()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func pgctr() {
        print(myPageControl.currentPage)
    }
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //        myTextView.frame = CGRect(x: 40, y: view.height/2, width: view.width-80, height: 60)
         myLabel.frame = CGRect(x: 40, y: 80, width: view.width-80, height: 60)
         myLabelcountry.frame = CGRect(x: 40, y: 200, width: view.width-80, height: 60)
        myButton.frame = CGRect(x: 40, y: view.height/2+130, width: view.width-80, height: 60)
        myPageControl.frame = CGRect(x: 40, y: view.height/2+200, width: view.width-80, height: 60)
        myDatePicker.frame = CGRect(x: 40, y: view.height/2-200, width: view.width-80, height: 60)
        myProgressView.frame = CGRect(x: 40, y: view.height/2+280, width: view.width-80, height: 60)
        myPickerView.frame = CGRect(x: 40, y: view.height/2-80 , width: view.width-80, height: 60)
        myStepper.frame = CGRect(x: 150, y: view.height/2+6, width: view.width-80, height: 60)
        myLabelStepper.frame = CGRect(x: 300, y: view.height/2-10, width: view.width-80, height: 60)
        myLabelExpe.frame = CGRect(x: 40, y: view.height/2-10, width: view.width-80, height: 60)
        mySlider.frame = CGRect(x: 100, y: view.height/2+68, width: view.width-150, height: 40)
        myLabelSlider.frame = CGRect(x: 80, y: view.height/2+80, width: view.width-80, height: 60)
        myLabelLvl.frame = CGRect(x: 40, y: view.height/2+30, width: view.width-80, height: 60)
    }
    
    
}
extension Detalis: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerData[row])
    }
}
