//
//  Detalis2.swift
//  UITemplet
//
//  Created by DCS on 19/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Detalis2: UIViewController {
    private let toolBar:UIToolbar = {
        let toolBar = UIToolbar()
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleGallery))
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handleCamera))
        toolBar.items = [cancel, gallery, camera]
        
        return toolBar
    }()
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(handleActivity), for: .touchUpInside)
        button.backgroundColor = .blue
        return button
    }()
    
    @objc func handleActivity() {
        DispatchQueue.main.async {
            self.myActivityIndicatorView.isHidden = !self.myActivityIndicatorView.isHidden
            self.myActivityIndicatorView.isHidden ? self.myActivityIndicatorView.stopAnimating() : self.myActivityIndicatorView.startAnimating()
        }
    }
    
    private let myActivityIndicatorView:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.color = .gray
        return activity
    }()
    private let mySwitch:UISwitch = {
        let switcher = UISwitch()
        switcher.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
//        switcher.backgroundColor = .blue
        return switcher
    }()
    
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 2
        pageControl.addTarget(self, action: #selector(pgctr), for: .valueChanged)
        return pageControl
    }()
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.99, animated: true)
        return progressView
    }()
    @objc private func handleCancel() {
        print("cancel called")
        self.dismiss(animated: true)
    }
    @objc func pgctr() {
        print(myPageControl.currentPage)
    }
    @objc private func handleGallery() {
        print("gallery called")
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true)
        }
    }
    @objc func handleSwitch() {
        print(mySwitch.isOn)
    }
    @objc private func handleCamera() {
        print("camera called")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            DispatchQueue.main.async {
                self.present(self.imagePicker, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Error!", message: "Camera not found. Select an image from your gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    private let tabBar:UITabBar = {
        let tabBar = UITabBar()
        let history = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let downloads = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        tabBar.items = [history, downloads]
        return tabBar
    }()
    private let myLabelTc:UILabel = {
        let label = UILabel()
        label.text = "T & C"
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .white
        label.textColor = .white
        label.font = .systemFont(ofSize:20)
        return label
    }()
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private let imagePicker:UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bck-2.jpg")!)
        view.addSubview(toolBar)
        view.addSubview(tabBar)
        view.addSubview(mySwitch)
        view.addSubview(myLabelTc)
        view.addSubview(myProgressView)
        view.addSubview(myButton)
        view.addSubview(myActivityIndicatorView)
        view.addSubview(myPageControl)
        tabBar.delegate = self
        
        view.addSubview(myImageView)
        imagePicker.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //let toolBarHeight:CGFloat = view.safeAreaInsets.top + 40
        toolBar.frame = CGRect(x: 0, y: 60, width: view.width, height: 40)
        
        let tabBarHeight:CGFloat = view.safeAreaInsets.bottom + 49
        tabBar.frame = CGRect(x: 0, y: view.height - tabBarHeight, width: view.width, height: tabBarHeight)
        myProgressView.frame = CGRect(x: 40, y: view.height/2+270, width: view.width-80, height: 60)
        myImageView.frame = CGRect(x: 20, y: toolBar.bottom + 40, width: view.width - 40, height: 200)
        mySwitch.frame = CGRect(x: 120, y: view.height/2+15, width: view.width-80, height: 60)
        myLabelTc.frame = CGRect(x: 40, y: view.height/2+5, width: view.width-80, height: 60)
        myButton.frame = CGRect(x: 40, y: view.height/2+150, width: view.width-80, height: 60)
        myActivityIndicatorView.frame = CGRect(x: 40, y: view.height/2+80, width: view.width-80, height: 60)
        myPageControl.frame = CGRect(x: 40, y: view.height/2+200, width: view.width-80, height: 60)
    }
}

extension Detalis2: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }
}

extension Detalis2:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            myImageView.image = selectedImage
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}
