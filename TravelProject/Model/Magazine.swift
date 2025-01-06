//
//  Magazine.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit

struct Magazine {
    static let defaultImage: UIImage = UIImage(named:"defaultImage")!

    let title: String
    let subtitle: String
    let photo_image: String
    let date: String
    let link: String
    
    init(title: String, subtitle: String, photo_image: String, date: String, link: String) {
        self.title = title
        self.subtitle = subtitle
        self.photo_image = photo_image
        self.date = date
        self.link = link
    }
    
    var formattedDate: String {
        let date = date.map { String($0) }
        let result = "\(date[0]+date[1])년 \(date[2]+date[3])월 \(date[4]+date[5])일"
        return result
    }
    
    var imageURL: URL {
        return URL(string: photo_image)!
    }
}
