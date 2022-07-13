//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by DmitriiG on 04.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var post: PostProtocol? {
        didSet {
            authorLabel.text = post?.author
            postImage.image = UIImage(named: "\(post?.image ?? "1")")
            descriprionLabel.text = post?.description
            likesLabel.text = "Likes: \(post?.likes ?? 0)"
            viewsLabel.text = "Views: \(post?.views ?? 0)"
        }
    }
    
    let authorLabel: UILabel = {
        let author = UILabel()
        author.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    
    let postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let descriprionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 14)
        //для автозаполнения
        description.numberOfLines = 0
        description.textColor = .gray
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    let likesLabel: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    
    let viewsLabel: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        
        self.addSubview(authorLabel)
        self.addSubview(postImage)
        self.addSubview(descriprionLabel)
        self.addSubview(likesLabel)
        self.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate(
            [
                self.authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                self.authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                self.authorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                self.authorLabel.heightAnchor.constraint(equalToConstant: 50),
                
                self.postImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                self.postImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                self.postImage.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 5),
                //self.postImage.bottomAnchor.constraint(equalTo: self.descriprionLabel.topAnchor, constant: -5),
                self.postImage.heightAnchor.constraint(equalToConstant: 200),
                
                self.descriprionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                self.descriprionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                self.descriprionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 5),
                self.descriprionLabel.bottomAnchor.constraint(equalTo: self.likesLabel.topAnchor, constant: -5),
                
                self.likesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
                self.likesLabel.topAnchor.constraint(equalTo: self.descriprionLabel.bottomAnchor, constant: 5),
                self.likesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                self.likesLabel.widthAnchor.constraint(equalToConstant: 100),
                
                self.viewsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                self.viewsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                self.viewsLabel.widthAnchor.constraint(equalToConstant: 100)
            ]
        )
    }
    
}
