//
//  AuthHeaderView.swift
//  LoginApp
//
//  Created by Слава on 11.11.2023.
//

import UIKit

class AuthHeaderView: UIView {

    //MARK: - UIComponents
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "profile.image")
        return iv
    }()
    private let titleLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .label
        lable.textAlignment = .center
        lable.font = .systemFont(ofSize: 26, weight: .bold)
        lable.text = "Error"
        return lable
    }()
    private let subTitleLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .secondaryLabel
        lable.textAlignment = .center
        lable.font = .systemFont(ofSize: 18, weight: .regular)
        lable.text = "Error"
        return lable
    }()
    
    //MARK: - LifeCycle
    init(title: String, subTitle:String){
        super.init(frame: .zero)
        titleLable.text = title
        subTitleLable.text = subTitle
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Mark: - UI Setup
    

    private func setupUI(){
        addSubview(logoImageView)
        addSubview(titleLable)
        addSubview(subTitleLable)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        subTitleLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 90),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),

            titleLable.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 19),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLable.trailingAnchor.constraint(equalTo: trailingAnchor),

            subTitleLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 12),
            subTitleLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            subTitleLable.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        ])
        
    }
    
}
