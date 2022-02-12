//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by DmitriiG on 10.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let profileView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            view.addSubview(profileView)
            profileView.nameOfUser.text = "Dmitry"
            
        }
    }
}
