//
//  CityViewCell.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/6/25.
//

import UIKit
import Kingfisher

class CityViewCell: UITableViewCell {
    
    static let identifier = "cityCell"
    
    @IBOutlet var shadowView: UIView!
    @IBOutlet var cityContentView: UIView!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var overlayView: UIView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var footerView: UIView!
    @IBOutlet var footerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    func configure() {
        cityContentView.backgroundColor = .clear
        
        shadowView.frame = cityImageView.frame
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadowView.layer.shadowRadius = 5
        shadowView.layer.cornerRadius = 24
        
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = 24
        cityImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
        overlayView.backgroundColor = .black
        overlayView.layer.opacity = 0.2
        overlayView.layer.cornerRadius = 24
        overlayView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
        cityNameLabel.textColor = .white
        cityNameLabel.textAlignment = .right
        cityNameLabel.font = .systemFont(ofSize: 22, weight: .black)

        footerView.backgroundColor = .black
        footerView.layer.opacity = 0.7
        footerView.layer.cornerRadius = 24
        footerView.layer.maskedCorners = [.layerMaxXMaxYCorner]
                
        footerLabel.textColor = .white
        footerLabel.textAlignment = .left
        footerLabel.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    func configureData(_ item: City) {
        cityImageView.kf.setImage(with: item.imageURL)
        cityNameLabel.text = item.city_name_kor_eng
        footerLabel.text = item.city_explain
    }
    
}
