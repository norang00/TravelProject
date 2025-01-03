//
//  Travel.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import Foundation

struct Travel {
    let title: String
    let description: String?
    let travel_image: String?
    let grade: Double?
    let save: Int?
    var like: Bool?
    let ad: Bool?
    
    init(title: String, description: String?, travel_image: String?, grade: Double?, save: Int?, like: Bool? = nil, ad: Bool?) {
        self.title = title
        self.description = description
        self.travel_image = travel_image
        self.grade = grade
        self.save = save
        self.like = like
        self.ad = ad
    }
}
