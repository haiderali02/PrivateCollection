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
    
    func showDeletImageConfirmaionAlert(for index: Int) {
        let confirmationAlert = UIAlertController(title: "Alert \(index)", message: "Do you really want to delete this image?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { _ in
            // Delete It
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            // Keep Silence
        }
        confirmationAlert.addAction(cancelAction)
        confirmationAlert.addAction(confirmAction)
        self.present(confirmationAlert, animated: true)
    }
    
    
    // MARK: - ACTIONS -
    @objc
    func didTapAddMore(_ sender: UIBarButtonItem) {
        print("asasas")
    }
    @objc
    func didTapLogOut(_ sender: UIBarButtonItem) {
        
    }
}

extension HomeViewController: CollectionViewDelegateAndDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeItemCell.self)", for: indexPath) as? HomeItemCell else {
            return UICollectionViewCell()
        }
        cell.crossButton.addTapGestureRecognizer {
            self.showDeletImageConfirmaionAlert(for: indexPath.row)
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return homeView.collectionView.frame.size
    }
}
