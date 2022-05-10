//
//  ProfileViewController-2.swift
//  Navigation
//
//  Created by DmitriiG on 02.03.2022.
//

import UIKit

protocol PostProtocol {
    var author: String { get set }
    var description: String { get set }
    var image: String { get set }
    var likes: Int { get set }
    var views: Int { get set }
}

struct Post: PostProtocol {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

class ProfileViewController: UIViewController {
    
    var postDataArray = [PostProtocol]()
        
    let profileHeaderView: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        profileHeader.backgroundColor = .clear
        return profileHeader
    }()
    
    let profileTableView: UITableView = {
        let profileTable = UITableView()
        profileTable.backgroundColor = .lightGray
        profileTable.translatesAutoresizingMaskIntoConstraints = false
        return profileTable
    }()
        
    func createPost() {
        postDataArray.append(Post(author: "Somebody", description: "Setting the number of lines is very important for dynamically sized cells. A label with its number of lines set to 0 will grow based on how much text it is showing. A label with number of lines set to any other number will truncate the text once it’s out of available lines", image: "1", likes: 25, views: 45))
        postDataArray.append(Post(author: "Anybody", description: "Thinking", image: "2", likes: 60, views: 78))
        postDataArray.append(Post(author: "Humane Being", description: "Doing", image: "3", likes: 44, views: 25))
        postDataArray.append(Post(author: "Animal", description: "Eating", image: "4", likes: 88, views: 99))
    }
    
    func setTable() {
        self.profileTableView.delegate = self
        self.profileTableView.dataSource = self
        self.profileTableView.register(UITableViewCell.self, forCellReuseIdentifier: "postTableViewCell")
        self.profileTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "profileHeaderView")
    }
    
    func setViews() {
        NSLayoutConstraint.activate([
            
            profileTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(profileTableView)
        createPost()
        setTable()
        setViews()
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.estimatedRowHeight = 310
                
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    // rows quantity
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDataArray.count
    }
   
    // cell configuration
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = PostTableViewCell()
        //Не удалось создать переиспользуемую ячейку через приведение класса UITableViewCell к PostTableViewCell, выдает ошибку
        //let cell = tableView.dequeueReusableCell(withIdentifier: "postTableViewCell", for: indexPath) as! PostTableViewCell
        cell.authorLabel.text = postDataArray[indexPath.row].author
        cell.postImage.image = UIImage(named: "\(postDataArray[indexPath.row].image)")
        cell.descriprionLabel.text = postDataArray[indexPath.row].description
        cell.likesLabel.text = "Likes: \(String(postDataArray[indexPath.row].likes))"
        cell.viewsLabel.text = "Views: \(String(postDataArray[indexPath.row].views))"
        
        return cell
    }
    
    // header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return profileHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220.00
    }

}
