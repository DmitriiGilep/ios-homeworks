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


