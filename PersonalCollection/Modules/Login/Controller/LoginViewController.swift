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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        let vc = HomeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func didTapSignup(_ sender: LoadingButton) {
        let vc = SignupViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
