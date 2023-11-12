//
//  RegisterController.swift
//  LoginApp
//
//  Created by Слава on 11.11.2023.
//

import UIKit

class RegisterController: UIViewController {
    
    //MARK: - UI Components
    private let headerView = AuthHeaderView.init(title: "Sing Up", subTitle: "Create your account")
    
    private let userNameField = CustomTextField.init(fieldType: .username)
    private let emailField = CustomTextField.init(fieldType: .email)
    private let passwordField = CustomTextField.init(fieldType: .password)
    
    
    private let singUpButton = CustomButton(title: "Sing Up", hasBackground: true, fontSize: .big)
    private let singInButton = CustomButton(title: "Already have an account? Sing In.", fontSize: .med)
    private let forgotPasswordButton = CustomButton(title: "Forgot Passworf?", fontSize: .small)

    private let termsTextView: UITextView = {
        let tv = UITextView()
        tv.text = "By creating an account, your agree to our Terms & Condition and you asknowlange that you have rad our Privacy Policy."
        tv.backgroundColor = .clear
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.isScrollEnabled = false
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        singUpButton.addTarget(self, action: #selector(didTapSingUp), for: .touchUpInside)
        singInButton.addTarget(self, action: #selector(didTapSingIn), for: .touchUpInside)

    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    private func setupUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        view.addSubview(userNameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(singUpButton)
        view.addSubview(termsTextView)
        view.addSubview(singInButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        userNameField.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        singUpButton.translatesAutoresizingMaskIntoConstraints = false
        termsTextView.translatesAutoresizingMaskIntoConstraints = false
        singInButton.translatesAutoresizingMaskIntoConstraints = false


        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 222),
            
            userNameField.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 12),
            userNameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            userNameField.heightAnchor.constraint(equalToConstant: 55),
            userNameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            emailField.topAnchor.constraint(equalTo: userNameField.bottomAnchor,constant: 12),
            emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor,constant: 22),
            passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 55),
            passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            singUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 22),
            singUpButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            singUpButton.heightAnchor.constraint(equalToConstant: 55),
            singUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            termsTextView.topAnchor.constraint(equalTo: singUpButton.bottomAnchor,constant: 6),
            termsTextView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

            singInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor,constant: 11),
            singInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            singInButton.heightAnchor.constraint(equalToConstant: 44),
            singInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
        
    }
    
    //MARK: - Selectors
    @objc func didTapSingUp() {
        let webViewer = WebViewController(with: "https://apple.com")
        let nav = UINavigationController(rootViewController: webViewer)
        present(nav, animated: true)
    }
    
    @objc func didTapSingIn() {
        navigationController?.popViewController(animated: true)
    }
}
