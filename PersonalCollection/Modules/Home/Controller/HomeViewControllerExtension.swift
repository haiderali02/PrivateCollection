//
//  HomeViewControllerExtension.swift
//  PersonalCollection
//
//  Created by Haider Ali on 28/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: CollectionViewDelegateAndDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HomeItemCell.self)", for: indexPath) as? HomeItemCell else {
            return UICollectionViewCell()
        }
        cell.crossButton.addTapGestureRecognizer {
            self.showDeletImageConfirmaionAlert(for: indexPath)
        }
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return homeView.collectionView.frame.size
    }
}

extension HomeViewController {
    
    func showDeletImageConfirmaionAlert(for indexPath: IndexPath) {
        let confirmationAlert = UIAlertController(title: "Alert", message: "Do you really want to delete this image?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { _ in
            self.homeView.collectionView.deleteItems(at: [indexPath])
            self.images.remove(at: indexPath.row)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            // Keep Silence
        }
        confirmationAlert.addAction(cancelAction)
        confirmationAlert.addAction(confirmAction)
        self.present(confirmationAlert, animated: true)
    }
    
}
