//
//  HomeController.swift
//  LoginApp
//
//  Created by Слава on 11.11.2023.
//

import UIKit

class HomeController: UIViewController {

    //MARK: - UI Components
    private let lable: UILabel = {
        let lable = UILabel()
        lable.textColor = .label
        lable.textAlignment = .center
        lable.font = .systemFont(ofSize: 24, weight: .semibold)
        lable.text = ""
        lable.numberOfLines = 2
        return lable
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        AuthService.shared.featchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showFetchingUserError(on: self, with: error)
                return
            }
            if let user = user {
                self.lable.text = "\(user.username)\n\(user.email)"
            }
        }
    }
    
    //MARK: - UI Setup
    private func setupUI(){
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogOut))
        
        view.addSubview(lable)
        lable.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([

            lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lable.centerYAnchor.constraint(equalTo: view.centerYAnchor),
 
        
        ])
        
    }
    
    //MARK: - Selector
    @objc private func didTapLogOut(){
        AuthService.shared.signOut { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showLogoutErrorAlert(on: self, with: error )
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
}
