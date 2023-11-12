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
        lable.text = "Loading..."
        lable.numberOfLines = 2
        return lable
    }()
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        lable.text = "CodeBrash\ncodebrash@gmail.com"
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
        
    }
}
