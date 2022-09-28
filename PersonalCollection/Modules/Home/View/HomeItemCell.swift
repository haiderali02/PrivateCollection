//
//  HomeItemCell.swift
//  PersonalCollection
//
//  Created by Haider Ali on 28/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import UIKit

class HomeItemCell: UICollectionViewCell {
    
    // MARK: - PROPERTIES -
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.image = UIImage(named: "backgroundImage")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var crossButton: UIImageView = {
        let view = UIImageView()
         view.clipsToBounds = true
         view.image = UIImage(systemName: "multiply")
         view.contentMode = .scaleAspectFit
        view.tintColor = .black
        return view
     }()
    
    weak var delegate: HomeItemProtocol?
    
    override init(frame: CGRect) {
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
        
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(crossButton)
        imageView.bringSubviewToFront(crossButton)
    }
    
    func configureViews() {
        contentView.backgroundColor = .clear
        
    }
    
    func setUpConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        crossButton.snp.makeConstraints { make in
            make.top.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            make.height.width.equalTo(25)
        }
    }
}
