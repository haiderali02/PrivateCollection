//
//  HomeViewController.swift
//  PersonalCollection
//
//  Created by Haider Ali on 28/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - PROPERTIES -
    
    let homeView: HomeView = HomeView(frame: UIScreen.main.bounds)
    var images: [UIImage] = [] {
        didSet {
            saveImages()
            homeView.collectionView.reloadData()
        }
    }
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavigationBar()
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func configureUI() {
        
        self.view = homeView
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self
        
        
        loadSavedImages()
    }
    
    func loadSavedImages() {
        if let imagesData = DBManager.shared.fetchImagesData() {
            
            imagesData.forEach { data in
                if let image = UIImage(data: data) {
                    self.images.append(image)
                    
                }
            }
            
        }
    }
    
    func saveImages() {
        
        var imagesData: [Data] = []
        
        if images.count > 0 {
            
            images.forEach { image in
                if let data = image.jpegData(compressionQuality: 0.5) {
                    imagesData.append(data)
                }
            }
            
        }
        
        DBManager.shared.addImages(imagesData: imagesData)
    }
    
    func configureNavigationBar() {
        // chevron.left
        let addMoreImageButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(didTapAddMore))
        
        let rightBarButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogOut))
        
        self.navigationItem.leftBarButtonItem = rightBarButton
        self.navigationItem.rightBarButtonItem = addMoreImageButton
       
    }
    
   
    
    
    // MARK: - ACTIONS -
    @objc
    func didTapAddMore(_ sender: UIBarButtonItem) {
        let mediaPicker = MediaPicker(numberOfItemsToBeSelected: 20)
        mediaPicker.showPicker(self) { items in
            self.images.append(contentsOf: items)
        }
    }
    @objc
    func didTapLogOut(_ sender: UIBarButtonItem) {
        
        UserManager.shared.deleteUser()
        
    }
}


