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
        self.navigationItem.title = "My Collection"
        self.view = homeView
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self
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
        
    }
}


