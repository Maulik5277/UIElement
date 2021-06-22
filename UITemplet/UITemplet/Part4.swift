//
//  Part4.swift
//  UITemplet
//
//  Created by DCS on 22/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part4: UIViewController {
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 2
        pageControl.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        pageControl.addTarget(self, action: #selector(pgctr), for: .valueChanged)
        return pageControl
    }()
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(1.0, animated: true)
        return progressView
    }()
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Upload Your Profile Picture"
        label.highlightedTextColor = .white
        label.font = .systemFont(ofSize:35)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    private let toolBar:UIToolbar = {
        let toolBar = UIToolbar()
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleGallery))
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handleCamera))
        toolBar.items = [cancel, gallery, camera]
        
        return toolBar
    }()
    @objc func handleActivity() {
        DispatchQueue.main.async {
            self.myActivityIndicatorView.isHidden = !self.myActivityIndicatorView.isHidden
            self.myActivityIndicatorView.isHidden ? self.myActivityIndicatorView.stopAnimating() : self.myActivityIndicatorView.startAnimating()
        }
    }
    
    private let myActivityIndicatorView:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        //activity.style = .large
        activity.color = .blue
        return activity
    }()
    private let tabBar:UITabBar = {
        let tabBar = UITabBar()
        let history = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let downloads = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        tabBar.items = [history, downloads]
        return tabBar
    }()
    private let myLabelTc:UILabel = {
        let label = UILabel()
        label.text = "Conform"
        label.backgroundColor = .clear
        label.textAlignment = .left
        label.highlightedTextColor = .white
        label.textColor = .black
        label.font = .systemFont(ofSize:25)
        return label
    }()
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "df.png")
        imageView.layer.cornerRadius = 45
        return imageView
    }()
    private let imagePicker:UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Book", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        button.layer.cornerRadius = 6
        return button
    }()
    private let mySwitch:UISwitch = {
        let switcher = UISwitch()
        switcher.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        //        switcher.backgroundColor = .blue
        return switcher
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
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myPageControl)
        view.addSubview(myProgressView)
        view.addSubview(myLabel)
        view.addSubview(toolBar)
        view.addSubview(tabBar)
        view.addSubview(mySwitch)
        view.addSubview(myLabelTc)
        view.addSubview(myActivityIndicatorView)
        view.addSubview(myPageControl)
        view.addSubview(myButton)
        tabBar.delegate = self
        
        view.addSubview(myImageView)
        imagePicker.delegate = self
        
        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //let toolBarHeight:CGFloat = view.safeAreaInsets.top + 40
        toolBar.frame = CGRect(x: 0, y: 85, width: view.width, height: 40)
        
        let tabBarHeight:CGFloat = view.safeAreaInsets.bottom + 49
        tabBar.frame = CGRect(x: 0, y: view.height - tabBarHeight, width: view.width, height: tabBarHeight)
        
        myImageView.frame = CGRect(x: 20, y: toolBar.bottom + 60, width: view.width - 40, height: 200)
        mySwitch.frame = CGRect(x: 140, y: view.height/2+15, width: view.width-80, height: 60)
        myLabelTc.frame = CGRect(x: 40, y: view.height/2+5, width: view.width-80, height: 60)
       
        myActivityIndicatorView.frame = CGRect(x: 40, y: view.height/2+75, width: view.width-80, height: 60)
        
        myPageControl.frame = CGRect(x: 160, y: view.height/2+300, width: 90, height: 40)
        myProgressView.frame = CGRect(x: 40, y: view.height/2+280, width: view.width-80, height: 60)
        myLabel.frame = CGRect(x: 40, y: view.height/2-330, width: view.width-80, height: 60)
        myButton.frame = CGRect(x: 40, y: view.height/2+200, width: view.width-80, height: 60)
    }
    
}
extension Part4: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }
}

extension Part4:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
