//
//  PhotosViewController.swift
//  Navigation
//
//  Created by DmitriiG on 20.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    var photosData: PhotosData = {
        let photos = PhotosData()
        photos.createPhotosData(photo: Photos(name: "1"))
        photos.createPhotosData(photo: Photos(name: "2"))
        photos.createPhotosData(photo: Photos(name: "3"))
        photos.createPhotosData(photo: Photos(name: "4"))
        photos.createPhotosData(photo: Photos(name: "5"))
        photos.createPhotosData(photo: Photos(name: "6"))
        photos.createPhotosData(photo: Photos(name: "7"))
        photos.createPhotosData(photo: Photos(name: "8"))
        photos.createPhotosData(photo: Photos(name: "9"))
        photos.createPhotosData(photo: Photos(name: "10"))
        photos.createPhotosData(photo: Photos(name: "11"))
        photos.createPhotosData(photo: Photos(name: "12"))
        photos.createPhotosData(photo: Photos(name: "13"))
        photos.createPhotosData(photo: Photos(name: "14"))
        photos.createPhotosData(photo: Photos(name: "15"))
        photos.createPhotosData(photo: Photos(name: "16"))
        photos.createPhotosData(photo: Photos(name: "17"))
        photos.createPhotosData(photo: Photos(name: "18"))
        photos.createPhotosData(photo: Photos(name: "19"))
        photos.createPhotosData(photo: Photos(name: "20"))
        return photos
    }()
    
    var photosCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(
            top: 8,
            left: 8,
            bottom: 8,
            right: 8)
        return layout
    } ()
    
    lazy var photosCollectionView: UICollectionView = {
        let photos = UICollectionView(frame: .zero, collectionViewLayout: photosCollectionViewFlowLayout)
        photos.dataSource = self
        photos.delegate = self
        photos.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self))
        photos.translatesAutoresizingMaskIntoConstraints = false
        return photos
    }()
    
    func setUP() {
        self.title = "Photo Gallery"
        self.view.addSubview(photosCollectionView)
        
        NSLayoutConstraint.activate([
            
            photosCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            
        ])
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
        navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosData.photosData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as? PhotosCollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = photosData.photosData[indexPath.row]
        cell.photo = data
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalPadding: CGFloat = 8*4
        let numberOfCellInRow : CGFloat = 3
        let collectionCellWidth: CGFloat = (self.view.frame.size.width - totalPadding) / numberOfCellInRow
        return CGSize(width: collectionCellWidth , height: collectionCellWidth*0.7)

    }
    
}
