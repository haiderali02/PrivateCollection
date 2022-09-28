//
//  HomeView.swift
//  PersonalCollection
//
//  Created by Haider Ali on 28/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - PROPERTIES -
    
    var collectionView: UICollectionView
    
    var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    var noImageFoundLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.text = "No Images Found \n You can add images by clicking + button from top right corner"
        return label
    }()
    
    override init(frame: CGRect) {
        collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: flowLayout)
        super.init(frame: frame)
        addViews()
        configureViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - METHODS -
    
    func addViews() {
        addSubview(collectionView)
        addSubview(noImageFoundLabel)
    }
    
    func configureViews() {
        self.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.isPrefetchingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(HomeItemCell.self, forCellWithReuseIdentifier: "\(HomeItemCell.self)")
    }
    
    func setUpConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        noImageFoundLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(safeAreaInsets).inset(20)
            make.center.equalToSuperview()
        }
    }
}
