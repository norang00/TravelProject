//
//  Magazine.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import Foundation

struct Magazine {
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
}
