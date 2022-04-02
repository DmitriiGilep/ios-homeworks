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
        view.backgroundColor = .lightGray
        title = "Profile"
        

    }

    override func viewWillLayoutSubviews() {
        let profileHeaderView = ProfileHeaderView()
            // приравнял фрэймы сабвью и супервью
        profileHeaderView.frame = self.view.frame
        profileHeaderView.backgroundColor = .clear
        profileHeaderView.layer.borderColor = UIColor.red.cgColor
        view.addSubview(profileHeaderView)
        
        
//        [
//            profileHeaderView.statusButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
//            profileHeaderView.statusButton.topAnchor.constraint(equalTo: profileHeaderView.profileImageView.bottomAnchor, constant: 16),
//            profileHeaderView.statusButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16),
//            profileHeaderView.statusButton.heightAnchor.constraint(equalToConstant: 50)
//        ]
//            .forEach{$0.isActive = true}
        
    }
    
   
    

}
