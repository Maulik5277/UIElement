//
//  Part3.swift
//  UITemplet
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part3: UIViewController {
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 1
        pageControl.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        pageControl.addTarget(self, action: #selector(pgctr), for: .valueChanged)
        return pageControl
    }()
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.60, animated: true)
        return progressView
    }()
    private let myTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Enter Your FullName"
        textView.textAlignment = .center
        textView.layer.cornerRadius = 15
        textView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return textView
    }()
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Personal Detalis"
        label.highlightedTextColor = .white
        label.font = .systemFont(ofSize:35)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    private let myTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Email"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return textField
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
        label.textColor = .black
        label.font = .systemFont(ofSize:50)
        return label
    }()
    private let myLabelLvl:UILabel = {
        let label = UILabel()
        label.text = "Rating"
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.highlightedTextColor = .white
        label.textColor = .black
        label.font = .systemFont(ofSize:20)
        return label
    }()
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        //        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        button.addTarget(self, action: #selector(MoveToPart4), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    private let myPickerView = UIPickerView()
    private let pickerData = ["Select Type","Express","Delux","Seating","Sleeper","Ac Coatch"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myPageControl)
        view.addSubview(myProgressView)
        view.addSubview(myTextView)
        view.addSubview(myTextField)
        view.addSubview(myPickerView)
        view.addSubview(myButton)
        view.addSubview(myLabel)
        view.addSubview(mySlider)
        view.addSubview(myLabelLvl)
        view.addSubview(myLabelSlider)
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    @objc func pgctr() {
        print(myPageControl.currentPage)
        
    }
    @objc func handleSlider() {
        print(mySlider.value)
        if(mySlider.value == 0.0 || mySlider.value >= 1.0)
        {
            myLabelSlider.text = "*"
        }
        if(mySlider.value == 1.0 || mySlider.value >= 2.0)
        {
            myLabelSlider.text = "*   *   *"
        }
        if(mySlider.value == 2.0 || mySlider.value >= 3.0)
        {
            myLabelSlider.text = "*   *   *   *   *"
        }
    }
    @objc func MoveToPart4(){
        let vc = Part4()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myLabel.frame = CGRect(x: 40, y: view.height/2-330, width: view.width-80, height: 60)
        myPageControl.frame = CGRect(x: 160, y: view.height/2+300, width: 90, height: 40)
         myProgressView.frame = CGRect(x: 40, y: view.height/2+280, width: view.width-80, height: 60)
        myTextView.frame = CGRect(x: 40, y: view.height/2-160, width: view.width-80, height: 60)
        myTextField.frame = CGRect(x: 40, y: view.height/2-250, width: view.width-80, height: 60)
        myPickerView.frame = CGRect(x: 40, y: view.height/2-80 , width: view.width-80, height: 130)
        mySlider.frame = CGRect(x: 100, y: view.height/2+100, width: view.width-150, height: 40)
        myLabelSlider.frame = CGRect(x: 80, y: view.height/2+120, width: view.width-80, height: 60)
        myLabelLvl.frame = CGRect(x: 40, y: view.height/2+50, width: view.width-80, height: 60)
        myButton.frame = CGRect(x: 40, y: view.height/2+200, width: view.width-80, height: 60)
    }

}
extension Part3: UIPickerViewDataSource, UIPickerViewDelegate {
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
