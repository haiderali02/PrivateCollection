//
//  SignupView.swift
//  PersonalCollection
//
//  Created by Haider Ali on 28/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import UIKit

class SignupView: UIView {
    
    // MARK: - PROPERTIES -
    var registerLabbel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = "Register"
        label.textColor = .black
        return label
    }()
    
    var createAnAccountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.text = "Create an account"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    var userNameField: CustomTextField = {
        let field = CustomTextField()
        field.fieldTitleLabel.text = "Enter your username"
        field.inputField.placeholder = "User name"
        field.inputField.isHidden = false
        return field
    }()
    
    var passwordField: CustomTextField = {
        let field = CustomTextField()
        field.fieldTitleLabel.text = "Enter your password"
        field.inputField.placeholder = "Password"
        field.inputField.isSecureTextEntry = true
        field.eyeButton.isHidden = false
        field.inputField.isHidden = false
        return field
    }()
    
    var genderField: CustomTextField = {
        let field = CustomTextField()
        field.fieldTitleLabel.text = "Select your gender"
        field.inputField.isHidden = true
        field.dropDownField.isHidden = false
        field.dropDownField.itemList = ["Male", "Female", "Other"]
        return field
    }()
    
    var dateOfBirthField: CustomTextField = {
        let field = CustomTextField()
        field.fieldTitleLabel.text = "Select your date of birth"
        field.inputField.isHidden = true
        field.dropDownField.isHidden = false
        field.dropDownField.dropDownMode = .date
        field.dropDownField.datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -10, to: Date()) // Minimum age should be 10 year old
        return field
    }()
    
    var topLabeleStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 2
        return view
    }()
    
    var parentVStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 16
        return view
    }()
    
    var signupButton: LoadingButton = {
        let button = LoadingButton()
        button.setTitle("SIGNUP", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        return button
    }()
    
    var loginButton: LoadingButton = {
        let button = LoadingButton()
        button.setTitle("Login to existing account", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        return button
    }()
    
    var orLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.text = "- OR -"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        return label
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
        
        addSubview(parentVStackView)
        
        parentVStackView.addArrangedSubview(topLabeleStackView)
        topLabeleStackView.addArrangedSubview(registerLabbel)
        topLabeleStackView.addArrangedSubview(createAnAccountLabel)
        
        parentVStackView.addArrangedSubview(userNameField)
        parentVStackView.addArrangedSubview(passwordField)
        
        parentVStackView.addArrangedSubview(genderField)
        parentVStackView.addArrangedSubview(dateOfBirthField)
        
        parentVStackView.addArrangedSubview(signupButton)
        parentVStackView.addArrangedSubview(orLabel)
        parentVStackView.addArrangedSubview(loginButton)
    }
    
    func configureViews() {
        self.backgroundColor = .white
    }
    
    func setUpConstraints() {
        parentVStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(16)
            make.bottom.lessThanOrEqualTo(safeAreaLayoutGuide)
        }
        signupButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
}
