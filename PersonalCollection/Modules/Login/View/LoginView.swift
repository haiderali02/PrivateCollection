//
//  LoginView.swift
//  PersonalCollection
//
//  Created by Haider Ali on 28/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import UIKit


class LoginView: UIView {
    
    // MARK: - PROPERTIES -
    var welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = "Welcome"
        label.textColor = .black
        return label
    }()
    
    var loginToYourAccountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.text = "Login to your account"
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
    
    var loginButton: LoadingButton = {
        let button = LoadingButton()
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        return button
    }()
    
    var signupButton: LoadingButton = {
        let button = LoadingButton()
        button.setTitle("CRETAE A NEW ACCOUNT", for: .normal)
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
        topLabeleStackView.addArrangedSubview(welcomeLabel)
        topLabeleStackView.addArrangedSubview(loginToYourAccountLabel)
        
        parentVStackView.addArrangedSubview(userNameField)
        parentVStackView.addArrangedSubview(passwordField)
        parentVStackView.addArrangedSubview(loginButton)
        parentVStackView.addArrangedSubview(orLabel)
        parentVStackView.addArrangedSubview(signupButton)
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
        loginButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
}
