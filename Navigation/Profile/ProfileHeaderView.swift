//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by DmitriiG on 02.03.2022.
//

import UIKit


class ProfileHeaderView: UIView {

    let profileImage = UIImage(named: "HAAL4885.jpeg")
    let profileImageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 125, height: 125))
    let profileName = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
    let textStatus = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    let statusButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
    let textStatusModified = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    let statusTextChangedButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
    
    
    //функция по выводу subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        setProfileImageView()
        setProfileName()
        setTextStatus()
        //  setStatusButton()
        setTextStatusModified()
        setStatusTextChangedButton()
        
    }

    //функция установки фото профиля
    func setProfileImageView() {
        //установил отступ от safeArea
        let topPadding = safeAreaInsets.top
        profileImageView.frame.origin.y = topPadding + 16
        //добавил картинку в view
        profileImageView.image = profileImage
        // настроил картинку - радиус скругления как половина ширины, ширина и цвет границы, обрезать myImage под скругленную view при помощи clipsToBounds, добавил представление на главную view
        profileImageView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        addSubview(profileImageView)
    }
 
    // функция установки имени
    func setProfileName() {
        let topPadding = safeAreaInsets.top
        profileName.frame.origin.y = topPadding + 27
        // прировнял центр profileName к центру родительской view
        profileName.center.x = self.center.x
        //добавил текст в label
        profileName.text = "Hipster Guy"
        // настроил надпись (или просто .black)
        profileName.textColor = UIColor.black
        profileName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        profileName.textAlignment = .center
        addSubview(profileName)
    }

    func setTextStatus() {
        let topPadding = safeAreaInsets.top
        textStatus.frame.origin.y = topPadding + 100
        // прировнял центр textStatus к центру родительской view
        textStatus.center.x = self.center.x
        textStatus.textColor = UIColor.gray
        textStatus.text = "Waiting for something"
        textStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textStatus.textAlignment = .center
        addSubview(textStatus)
        
    }
    
//    func setStatusButton() {
//        let topPadding = safeAreaInsets.top
//        statusButton.frame.origin.y = topPadding + 200
//        statusButton.center.x = self.center.x
//        statusButton.setTitle("Show status", for: .normal)
//        statusButton.backgroundColor = .blue
//        statusButton.addTarget(self, action: #selector(pressStatusButton), for: .touchUpInside)
//        statusButton.layer.cornerRadius = 4
//        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
//        statusButton.layer.shadowRadius = 4
//        statusButton.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
//        statusButton.layer.shadowOpacity = 0.7
//        addSubview(statusButton)
//
//        statusButton.translatesAutoresizingMaskIntoConstraints = false
//
//
//    }
//
//    @objc func pressStatusButton () {
//        if let status = textStatus.text {
//            print(status)
//        }
//     }
    
    func setTextStatusModified() {
        let topPadding = safeAreaInsets.top
        textStatusModified.frame.origin.y = topPadding + 150
        textStatusModified.center.x = self.center.x
        textStatusModified.layer.borderWidth = 1
        textStatusModified.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textStatusModified.layer.cornerRadius = 12
        textStatusModified.layer.backgroundColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        
        addSubview(textStatusModified)
        
        textStatusModified.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }
    
    private var statusText: String = ""
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        textStatusModified.textColor = UIColor.black
        textStatusModified.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textStatusModified.textAlignment = .natural
        textStatusModified.textAlignment = .center
        if let textExist = textStatusModified.text {
            statusText = textExist
        }
        return
    }

    
    func setStatusTextChangedButton() {
        let topPadding = safeAreaInsets.top
        statusTextChangedButton.frame.origin.y = topPadding + 200
        statusTextChangedButton.center.x = self.center.x
        statusTextChangedButton.setTitle("Set status", for: .normal)
        statusTextChangedButton.backgroundColor = .blue
     
        statusTextChangedButton.addTarget(self, action: #selector(pressSetButton), for: .touchUpInside)
        statusTextChangedButton.layer.cornerRadius = 4
        addSubview(statusTextChangedButton)
        statusTextChangedButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    @objc func pressSetButton (_ textField: UITextField) {
        textStatus.text = statusText
        }

}
