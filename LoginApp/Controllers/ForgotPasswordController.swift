//
//  ForgotPasswordController.swift
//  LoginApp
//
//  Created by Слава on 11.11.2023.
//

import UIKit

class ForgotPasswordController: UIViewController {

    //MARK: - UI Components
    private let headerView = AuthHeaderView(title: "Forgot Password", subTitle: "Reset your password")
    
    private let emailField = CustomTextField(fieldType: .email)
    private let resetPasswordButton = CustomButton(title: "Reset",hasBackground: true,  fontSize: .big)
     
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        resetPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false

    }
    
    //MARK: - UI Setup
    private func setupUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        view.addSubview(emailField)
        view.addSubview(resetPasswordButton)

        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 230),
            
            emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 11),
            emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            resetPasswordButton.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 11),
            resetPasswordButton.centerXAnchor.constraint(equalTo: emailField.centerXAnchor),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 55),
            resetPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        
        ])
        
    }
    
    
    //MARK: - Selector
    @objc private func didTapForgotPassword(){
        guard let email = emailField.text, !email.isEmpty else { return }
        //TODO: - Email validation 
    }
    
}
