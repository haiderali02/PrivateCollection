//
//  LoginViewController.swift
//  PersonalCollection
//
//  Created by Haider Ali on 28/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - PROPERTIES -
    
    let loginView: LoginView = LoginView(frame: UIScreen.main.bounds)
    
    // MARK: - LIFE CYCLE -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserManager.shared.isLoggedIn() {
            navigateToHome()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func navigateToHome() {
        let vc = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - METHODS -
    
    private func configureUI() {
        self.view = loginView
        loginView.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        loginView.signupButton.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)
    }
    
    // MARK: - ACTIONS -
    @objc
    func didTapLogin(_ sender: LoadingButton) {
        
        guard let userName = loginView.userNameField.inputField.text,
              let password = loginView.passwordField.inputField.text else {
            return
        }
        
        if userName.count > 0 && password.count > 0 {
            DBManager.shared.loginUser(username: userName, password: password) { success, error in
                
                if error == nil {
                    self.navigateToHome()
                } else {
                    self.showAlert(title: "Alert", message: error ?? "")
                }
                
            }
            
        }
    }
    
    @objc
    func didTapSignup(_ sender: LoadingButton) {
        let vc = SignupViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
