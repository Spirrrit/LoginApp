//
//  LoginController.swift
//  LoginApp
//
//  Created by Слава on 11.11.2023.
//

import UIKit

class LoginController: UIViewController {

    //MARK: - UI Components
    private let headerView = AuthHeaderView.init(title: "Sing In", subTitle: "Sing in to your account")
    
    private let emailField = CustomTextField.init(fieldType: .email)
    private let passwordField = CustomTextField.init(fieldType: .password)
    private let singInButton = CustomButton(title: "Sing In", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "New user? Create Account.", fontSize: .med)
    private let forgotPasswordButton = CustomButton(title: "Forgot Passworf?", fontSize: .small)

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        didTapNewUser()
        setupUI()
        
        singInButton.addTarget(self, action: #selector(didTapSingIn), for: .touchUpInside)
        newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    private func setupUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(singInButton)
        view.addSubview(newUserButton)
        view.addSubview(forgotPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        singInButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 222),
            
            emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 12),
            emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 22),
            passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 55),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            singInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 22),
            singInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            singInButton.heightAnchor.constraint(equalToConstant: 55),
            singInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            newUserButton.topAnchor.constraint(equalTo: singInButton.bottomAnchor,constant: 11),
            newUserButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            newUserButton.heightAnchor.constraint(equalToConstant: 44),
            newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor,constant: 6),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

        
        ])
        
    }
    
    //MARK: - Selectors
    
    @objc func didTapSingIn() {
        let vc = HomeController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    @objc func didTapNewUser() {
        let vc = RegisterController()
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @objc func didTapForgotPassword() {
        let vc = ForgotPasswordController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
