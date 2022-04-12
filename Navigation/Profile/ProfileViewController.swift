//
//  ProfileViewController-2.swift
//  Navigation
//
//  Created by DmitriiG on 02.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        self.title = "Profile"
       
      
        let profileHeaderView: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
            profileHeader.backgroundColor = .white
            profileHeader.layer.borderColor = UIColor.red.cgColor
            profileHeader.layer.borderWidth = 3
            profileHeader.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(profileHeader)
            [
                profileHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                profileHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                profileHeader.heightAnchor.constraint(equalToConstant: 220)
            ]
                .forEach{$0.isActive = true}
            return profileHeader
    }()
        
        profileHeaderView.setSubViews()

    }
    
}

