//
//  ProfileViewController-2.swift
//  Navigation
//
//  Created by DmitriiG on 02.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        profileHeader.backgroundColor = .clear
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        return profileHeader
    }()
    
    func setProfileHeaderView() {
        self.view.addSubview(profileHeaderView)
        [
            profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ]
            .forEach{$0.isActive = true}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.title = "Profile"
        
        setProfileHeaderView()
        
    }
    
}

