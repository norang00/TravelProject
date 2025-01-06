//
//  City.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/6/25.
//
import UIKit

struct City {
    static let defaultImage: UIImage = UIImage(named:"defaultImage")!
    
    let city_name: String
    let city_english_name: String
    let city_explain: String
    let city_image: String
    let domestic_travel: Bool
    
    init(city_name: String, city_english_name: String, city_explain: String, city_image: String, domestic_travel: Bool) {
        self.city_name = city_name
        self.city_english_name = city_english_name
        self.city_explain = city_explain
        self.city_image = city_image
        self.domestic_travel = domestic_travel
    }
    
    var imageURL: URL? {
        return URL(string: city_image)
    }
    
    var city_name_kor_eng: String {
        return "\(city_name) | \(city_english_name)"
    }
}


