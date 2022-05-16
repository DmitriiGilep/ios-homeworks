//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by DmitriiG on 02.03.2022.
//

import UIKit


class ProfileHeaderView: UIView {
    
    let avatarImageView: UIImageView = {
        let avatar = UIImageView()
        let avatarImage = UIImage(named: "HAAL4885.jpeg")
        avatar.image = avatarImage
        avatar.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        avatar.layer.borderWidth = 3
        avatar.layer.cornerRadius = 55
        avatar.clipsToBounds = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()
    
    let fullNameLabel: UILabel = {
        let fullName = UILabel()
        fullName.text = "Hipster Guy"
        fullName.textColor = UIColor.black
        fullName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullName.textAlignment = .center
        fullName.translatesAutoresizingMaskIntoConstraints = false
        return fullName
    }()
    
    let statusLabel: UILabel = {
        let status = UILabel()
        status.textColor = UIColor.gray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textAlignment = .center
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    let statusTextField: UITextField = {
        let statusText = UITextField()
        statusText.layer.borderWidth = 1
        statusText.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        statusText.layer.cornerRadius = 12
        statusText.layer.backgroundColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        statusText.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusText.translatesAutoresizingMaskIntoConstraints = false
        return statusText
    }()
    
    private var statusText: String = ""
    
    let setStatusButton: UIButton = {
        let setStatus = UIButton()
        setStatus.setTitle("Set status", for: .normal)
        setStatus.backgroundColor = .blue
        setStatus.addTarget(self, action: #selector(pressSetButton), for: .touchUpInside)
        setStatus.layer.cornerRadius = 4
        setStatus.translatesAutoresizingMaskIntoConstraints = false
        return setStatus
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubViews()
        self.addConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        statusTextField.textColor = UIColor.black
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textAlignment = .natural
        statusTextField.textAlignment = .center
        if let textExist = statusTextField.text {
            statusText = textExist
        }
        return
    }
    
    @objc func pressSetButton (_ textField: UITextField) {
        statusLabel.text = statusText
    }
    
    func addSubViews() {
        
        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(setStatusButton)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 10),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 46),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 40),
            
            statusLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            statusLabel.bottomAnchor.constraint(equalTo: self.setStatusButton.topAnchor, constant: -74),
            
            statusTextField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 5),
            statusTextField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

