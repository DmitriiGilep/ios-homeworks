//
//  ProfileViewController-2.swift
//  Navigation
//
//  Created by DmitriiG on 02.03.2022.
//

import UIKit


class ProfileViewController: UIViewController {
    
    var postDataArray = postData.postDataArray
    
    let profileHeaderView: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        profileHeader.backgroundColor = .clear
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        return profileHeader
    }()
    
    let profileTableView: UITableView = {
        let profileTable = UITableView()
        profileTable.backgroundColor = .white
        profileTable.translatesAutoresizingMaskIntoConstraints = false
        return profileTable
    }()
    
   
    
    func setTable() {
        self.profileTableView.delegate = self
        self.profileTableView.dataSource = self
        self.profileTableView.register(UITableViewCell.self, forCellReuseIdentifier: "profileHeaderViewCell")
        self.profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "postTableViewCell")
        
        NSLayoutConstraint.activate([
            
            profileTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(profileTableView)
        setTable()
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.estimatedRowHeight = 310
        
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    // rows quantity
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (postDataArray.count+1)
    }
    
    // cell configuration
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileHeaderViewCell", for: indexPath)
            cell.addSubview(profileHeaderView)
            NSLayoutConstraint.activate([
                profileHeaderView.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                profileHeaderView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
                profileHeaderView.topAnchor.constraint(equalTo: cell.topAnchor),
                profileHeaderView.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
            ])
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "postTableViewCell", for: indexPath) as! PostTableViewCell
            let data = postDataArray[indexPath.row-1]
            cell.post = data
            return cell
        }
    }
    
    
}
