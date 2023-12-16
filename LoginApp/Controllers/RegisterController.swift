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
        let atributedString = NSMutableAttributedString(string: "By creating an account, your agree to our Terms & Condition and you asknowlange that you have rad our Privacy Policy.")
        
        atributedString.addAttribute(.link, value: "term://termAddCondition", range: (atributedString.string as NSString).range(of: "Terms & Condition"))
        
        atributedString.addAttribute(.link, value: "privacy://privacyPolicy", range: (atributedString.string as NSString).range(of: "Privacy Policy"))
        
        let tv = UITextView()
        tv.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        tv.backgroundColor = .clear
        tv.attributedText = atributedString
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.delaysContentTouches = false
        tv.isScrollEnabled = false
        
        return tv
    }()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        termsTextView.delegate = self
        
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
        let registerUserRequest = RegiserUserRequest(
            username: userNameField.text ?? "",
            email: emailField.text ?? "",
            password: passwordField.text ?? ""
        )
        
        // Username Check
        if !Validator.isValidUsername(with: registerUserRequest.username){
            AlertManager.showInvolidUsernameALert(on: self)
            return
        }
        
        // Email Check
        if !Validator.isValidEmail(with: registerUserRequest.email){
            AlertManager.showInvolidEmailALert(on: self)
            return
        }
        
        // Password Check
        if !Validator.isValidPassword(with: registerUserRequest.password){
            AlertManager.showInvolidPasswordlALert(on: self)
            return
        }
        
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self]
            wasRegistered , error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                } else {
                    AlertManager.showRegistrationErrorAlert(on: self)
                }
            }
        }
    }
    
    @objc func didTapSingIn() {
        navigationController?.popViewController(animated: true)
    }
}

extension RegisterController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.scheme == "term" {
            showWebViewController(with: "https://policies.google.com/terms?hl=en")
        } else if URL.scheme == "privacy" {
            showWebViewController(with: "https://policies.google.com/privacy?h1=en")
        }
        
        return true
    }
    
    private func showWebViewController(with urlString: String ) {
        let vc = WebViewController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
}
