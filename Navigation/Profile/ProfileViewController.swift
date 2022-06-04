//
//  ProfileViewController-2.swift
//  Navigation
//
//  Created by DmitriiG on 02.03.2022.
//

import UIKit


class ProfileViewController: UIViewController {
    
    var postDataArray = postData.postDataArray
    var postPhotos = ["1", "2", "3", "4"]
    
    let profileHeaderView: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        return profileHeader
    }()
    
    let avatarImageView: UIImageView = {
        let avatar = UIImageView()
        let avatarImage = UIImage(named: "Avatar.jpeg")
        avatar.image = avatarImage
        avatar.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        avatar.layer.borderWidth = 3
        avatar.layer.cornerRadius = 55
        avatar.clipsToBounds = true
        avatar.contentMode = .scaleAspectFill
        avatar.isUserInteractionEnabled = true
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
    }()

    lazy var tapOnAvatar: UITapGestureRecognizer = {
                let recognizer = UITapGestureRecognizer()
                recognizer.numberOfTouchesRequired = 1
                recognizer.numberOfTapsRequired = 1
                recognizer.addTarget(self, action: #selector(avatarChanging))
                return recognizer
            }()

    @objc private func avatarChanging (_gesture: UITapGestureRecognizer) {
        
        print("tap works")
        avatarImageView.layer.cornerRadius = 0
        avatarImageView.layer.borderWidth = 0
        avatarImageView.clipsToBounds = false
        view.addSubview(avatarImageView)
        avatarImageViewTop = avatarImageView.topAnchor.constraint(equalTo: view.topAnchor)
        avatarImageViewLeading = avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        avatarImageViewWidth = avatarImageView.widthAnchor.constraint(equalTo: view.widthAnchor)
        avatarImageViewHeight = avatarImageView.heightAnchor.constraint(equalTo: view.heightAnchor)
        NSLayoutConstraint.activate([
            avatarImageViewTop,avatarImageViewLeading, avatarImageViewWidth, avatarImageViewHeight
        ].compactMap{ $0 })
        
//        UIView.animate(withDuration: 3) {
//            self.backgroundColor = .green
//        }
        
    }
    
    let profileTableView: UITableView = {
        let profileTable = UITableView()
        profileTable.backgroundColor = .white
        profileTable.translatesAutoresizingMaskIntoConstraints = false
        return profileTable
    }()
    
    private var avatarImageViewTop: NSLayoutConstraint?
    private var avatarImageViewLeading: NSLayoutConstraint?
    private var avatarImageViewWidth: NSLayoutConstraint?
    private var avatarImageViewHeight: NSLayoutConstraint?

    
    func setProfileHeaderView() {
        profileHeaderView.addSubview(avatarImageView)
        avatarImageView.addGestureRecognizer(tapOnAvatar)
       
        avatarImageViewTop = avatarImageView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16)
        avatarImageViewLeading = avatarImageView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16)
        avatarImageViewWidth = avatarImageView.widthAnchor.constraint(equalToConstant: 110)
        avatarImageViewHeight = avatarImageView.heightAnchor.constraint(equalToConstant: 110)
        
        NSLayoutConstraint.activate([
            avatarImageViewTop,avatarImageViewLeading, avatarImageViewWidth, avatarImageViewHeight
        ].compactMap{ $0 })
    }
    
    func setTable() {
        self.profileTableView.delegate = self
        self.profileTableView.dataSource = self
        self.profileTableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: ProfileHeaderView.self))
        self.profileTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        self.profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        
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
        setProfileHeaderView()
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.estimatedRowHeight = 310
        
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // rows quantity
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionNumber = section
        if sectionNumber == 0 || sectionNumber == 1 {
            return 1
        } else if sectionNumber == 2 {
            return (postDataArray.count)
        }
        return sectionNumber
    }
    
    // cell configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileHeaderView.self), for: indexPath)
            
            cell.addSubview(profileHeaderView)
            NSLayoutConstraint.activate([
                profileHeaderView.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                profileHeaderView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
                profileHeaderView.topAnchor.constraint(equalTo: cell.topAnchor),
                profileHeaderView.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
            ])

            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as? PhotosTableViewCell else {return UITableViewCell()}
            cell.setImages(imagesNames: postPhotos)
            return cell
            
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as? PostTableViewCell else {
                return UITableViewCell()
            }
            
            let data = postDataArray[indexPath.row]
            cell.post = data
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)
        }
    }
}
