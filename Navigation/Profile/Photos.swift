//
//  Photos.swift
//  Navigation
//
//  Created by DmitriiG on 23.05.2022.
//

import Foundation

struct Photos {
    var name: String
}

class PhotosData {
    
    var photosData = [Photos]()
    func createPhotosData(photo: Photos) {
        photosData.append(photo)
    }
}

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
