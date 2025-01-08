//
//  Restaurant.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/8/25.
//

import Foundation

struct Restaurant {
    let image: String
    let latitude: Double
    let longitude: Double
    let name: String
    let address: String
    let phoneNumber: String
    let category: String
    let price: Int
    let type: Int
    
    init(image: String, latitude: Double, longitude: Double, name: String, address: String, phoneNumber: String, category: String, price: Int, type: Int) {
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.address = address
        self.phoneNumber = phoneNumber
        self.category = category
        self.price = price
        self.type = type
    }
}
