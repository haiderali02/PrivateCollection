//
//  SignupViewController.swift
//  PersonalCollection
//
//  Created by Haider Ali on 28/09/2022.
//  Copyright © 2022 haiderapps. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: - PROPERTIES -
    
    let signupView: SignupView = SignupView(frame: UIScreen.main.bounds)
    
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
    
    // MARK: - METHODS
    
    func configureUI() {
        self.navigationItem.title = ""
        self.view = signupView
        
        signupView.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        signupView.signupButton.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)
    }
    
    // MARK: - ACTIONS -
    @objc
    func didTapLogin(_ sender: LoadingButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func didTapSignup(_ sender: LoadingButton) {
        
        guard let userName = signupView.userNameField.inputField.text,
              let password = signupView.passwordField.inputField.text,
              let gender = signupView.genderField.dropDownField.selectedItem,
              let dob = signupView.dateOfBirthField.dropDownField.selectedItem
        else {
            return
        }
        
        if userName.count < 2 {
            self.showAlert(title: "Alert", message: "Username should contain minimum 2 characters")
            return
        } else if password.count < 5 {
            self.showAlert(title: "Alert", message: "Password should contain minimum 6 characters")
            return
        } else {
            DBManager.shared.createNewUser(userName: userName, userPassword: password, userDOB: dob, userGender: gender) { success, error in
                if error == nil {
                    let vc = HomeViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    self.showAlert(title: "Alert", message: error ?? "")
                }
                
            }
        }
    }
}
