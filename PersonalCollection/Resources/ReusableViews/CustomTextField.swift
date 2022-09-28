//
//  CustomTextField.swift
//  PersonalCollection
//
//  Created by Haider Ali on 28/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import UIKit
import IQDropDownTextFieldSwift
import SnapKit

class CustomTextField: UIView {
    
    // MARK: - PROPERTIES -
    
    var fieldTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.text = "Text Field Title"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    var segmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: ["Hot Pink", "Calm Purple"])
        segmentControl.isHidden = true
        return segmentControl
    }()
    
    var inputField: UITextField = {
        let field = UITextField()
        field.font = .systemFont(ofSize: 14)
        field.textColor = .black
        field.autocapitalizationType = .none
        field.placeholder = "Place Holder"
        field.borderStyle = .roundedRect
        return field
    }()
    
    var dropDownField: IQDropDownTextField = {
        let field = IQDropDownTextField()
        field.font = .systemFont(ofSize: 14)
        field.textColor = .black
        field.isOptionalDropDown = true
        field.autocapitalizationType = .none
        field.isHidden = true
        field.placeholder = "Place Holder"
        field.borderStyle = .roundedRect
        return field
    }()
    
    var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    var eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        button.isSelected = true
        button.isHidden = true
        button.tintColor = .black
        return button
    }()
    
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
        addSubview(stackView)
        stackView.addArrangedSubview(fieldTitleLabel)
        stackView.addArrangedSubview(inputField)
        stackView.addArrangedSubview(dropDownField)
        stackView.addArrangedSubview(segmentControl)
        addSubview(eyeButton)
    }
    
    func configureViews() {
        eyeButton.addTapGestureRecognizer {
            self.eyeButton.isSelected = !self.eyeButton.isSelected
            self.inputField.isSecureTextEntry = !self.inputField.isSecureTextEntry
        }
    }
    
    func setUpConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        fieldTitleLabel.snp.makeConstraints { make in
            //make.height.equalTo(16)
        }
        inputField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        dropDownField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        segmentControl.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        eyeButton.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerY.equalTo(inputField.snp.centerY)
        }
    }
}
