//
//  LogInViewController.swift
//  Navigation
//
//  Created by DmitriiG on 17.04.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let logInScrollView: UIScrollView = {
        let logInScroll = UIScrollView()
        logInScroll.translatesAutoresizingMaskIntoConstraints = false
        return logInScroll
    }()
    
    let logInContentView: UIView = {
        let logInView = UIView()
        logInView.backgroundColor = .white
        logInView.translatesAutoresizingMaskIntoConstraints = false
        return logInView
    }()
        
    let vkImageView: UIImageView = {
        let vk = UIImageView()
        let vkImage = UIImage(named: "logo")
        vk.image = vkImage
        vk.contentMode = .scaleAspectFit
        vk.translatesAutoresizingMaskIntoConstraints = false
        return vk
    }()
    
    let loginField: UIView = {
        let loginField = UIView()
        loginField.backgroundColor = .systemGray6
        loginField.layer.borderWidth = 0.5
        loginField.layer.borderColor = UIColor.lightGray.cgColor
        loginField.layer.cornerRadius = 10
        loginField.translatesAutoresizingMaskIntoConstraints = false
        return loginField
    }()
     
    let nameTextField: UITextField = {
        let nameText = UITextField()
        nameText.backgroundColor = .systemGray6
        nameText.layer.borderWidth = 0.5
        nameText.layer.borderColor = UIColor.lightGray.cgColor
        nameText.clipsToBounds = true
        nameText.layer.cornerRadius = 10
        nameText.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        nameText.textColor = UIColor.black
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        nameText.leftViewMode = .always
        nameText.leftView = spacerView
        nameText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        nameText.tintColor = UIColor(named: "AccentColor")
        nameText.autocapitalizationType = .none
        nameText.placeholder = "Email or phone"
        nameText.translatesAutoresizingMaskIntoConstraints = false
        return nameText
    }()
    
    let passwordTextField: UITextField = {
        let passwordText = UITextField()
        passwordText.backgroundColor = .systemGray6
        //passwordText.layer.borderWidth = 0.5
        //passwordText.layer.borderColor = UIColor.lightGray.cgColor
        passwordText.textColor = UIColor.black
        passwordText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordText.tintColor = UIColor(named: "AccentColor")
        passwordText.autocapitalizationType = .none
        passwordText.placeholder = "Password"
        passwordText.isSecureTextEntry = true
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        return passwordText
    }()
    
    let logInButton: UIButton = {
        let logIn = UIButton()
        let backgroundImage = UIImage(named: "blue_pixel")
        logIn.setTitle("Log In", for: .normal)
        logIn.layer.cornerRadius = 10
        logIn.clipsToBounds = true
        logIn.backgroundColor = .blue
        logIn.titleLabel?.textColor = .white
        
        logIn.addTarget(self, action: #selector(pressLogInButton), for: .touchUpInside)
        logIn.setBackgroundImage(backgroundImage, for: .normal)
        logIn.translatesAutoresizingMaskIntoConstraints = false
        return logIn
    }()
    
    let profileViewController = ProfileViewController()
    @objc func pressLogInButton () {
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    // Устанавливает все вью
    func setAllViews() {

        self.view.addSubview(logInScrollView)
        [
            logInScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            logInScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            logInScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            logInScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]
            .forEach{$0.isActive = true}
        
        
        self.logInScrollView.addSubview(logInContentView)
        [
            logInContentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            logInContentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            logInContentView.heightAnchor.constraint(equalToConstant: 1200)
            
        ]
            .forEach{$0.isActive = true}
        
        self.logInContentView.addSubview(vkImageView)
        [
            vkImageView.centerXAnchor.constraint(equalTo: self.logInContentView.centerXAnchor),
            vkImageView.topAnchor.constraint(equalTo: self.logInContentView.topAnchor, constant: 120),
            vkImageView.widthAnchor.constraint(equalToConstant: 100),
            vkImageView.heightAnchor.constraint(equalToConstant: 100)
        ]
            .forEach{$0.isActive = true}
                
        self.logInContentView.addSubview(loginField)
        [
            loginField.leadingAnchor.constraint(equalTo: self.logInContentView.leadingAnchor, constant: 16),
            loginField.trailingAnchor.constraint(equalTo: self.logInContentView.trailingAnchor, constant: -16),
            loginField.topAnchor.constraint(equalTo: self.vkImageView.bottomAnchor, constant: 120),
            loginField.heightAnchor.constraint(equalToConstant: 100)
            
        ]
            .forEach{$0.isActive = true}

        self.loginField.addSubview(nameTextField)
        [
            nameTextField.leadingAnchor.constraint(equalTo: self.loginField.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: self.loginField.trailingAnchor),
            nameTextField.topAnchor.constraint(equalTo: self.loginField.topAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
        ]
            .forEach{$0.isActive = true}

        self.loginField.addSubview(passwordTextField)
        [
            passwordTextField.leadingAnchor.constraint(equalTo: self.loginField.leadingAnchor, constant: 10),
 //           passwordTextField.trailingAnchor.constraint(equalTo: self.loginField.trailingAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: self.loginField.bottomAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ]
            .forEach{$0.isActive = true}

        
        self.logInContentView.addSubview(logInButton)
        [
            logInButton.leadingAnchor.constraint(equalTo: self.logInContentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: self.logInContentView.trailingAnchor, constant: -16),
            logInButton.topAnchor.constraint(equalTo: self.loginField.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
            
        ]
            .forEach{$0.isActive = true}
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setAllViews()
        
        let notificationCentre = NotificationCenter.default
        notificationCentre.addObserver(self, selector: #selector(handleKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCentre.addObserver(self, selector: #selector(handleKeyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        let notificationCentre = NotificationCenter.default
        notificationCentre.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCentre.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func handleKeyboardShow(notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.logInScrollView.contentInset.bottom = keyboardFrame.height
            self.logInScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0,bottom: keyboardFrame.height, right: 0)
        }
    }
    
    @objc private func handleKeyboardHide(notification: NSNotification) {
        self.logInScrollView.contentInset.bottom = .zero
        self.logInScrollView.verticalScrollIndicatorInsets = .zero
    }
}
