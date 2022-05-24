//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by DmitriiG on 19.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let arrow: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage(named: "Arrow")
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
 
    let image1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "1")
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let image2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "2")
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let image3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "3")
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let image4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "4")
        image.layer.cornerRadius = 6
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let imagesStack: UIStackView = {
        let images = UIStackView()
        images.axis = .horizontal
        images.spacing = 8
        images.distribution = .fillEqually
        images.translatesAutoresizingMaskIntoConstraints = false
   //     images.distribution = .
        return images
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        setUp()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
        self.addSubview(photoLabel)
        photoLabel.addSubview(arrow)
        imagesStack.addArrangedSubview(image1)
        imagesStack.addArrangedSubview(image2)
        imagesStack.addArrangedSubview(image3)
        imagesStack.addArrangedSubview(image4)
        self.addSubview(imagesStack)
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            photoLabel.bottomAnchor.constraint(equalTo: imagesStack.topAnchor, constant: -12),
            photoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            
            arrow.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: photoLabel.trailingAnchor),
            
            imagesStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            imagesStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            imagesStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            imagesStack.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            imagesStack.heightAnchor.constraint(equalToConstant: 80)
            
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
