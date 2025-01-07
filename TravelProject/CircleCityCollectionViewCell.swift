//
//  CircleCityCollectionViewCell.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit
import Kingfisher

class CircleCityCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "CircleCityCollectionViewCell"

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure() {
        print(#function)
        
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = 65
        
        cityNameLabel.font = .systemFont(ofSize: 16, weight: .black)
        cityNameLabel.textColor = .black
        cityNameLabel.textAlignment = .center
        cityNameLabel.contentMode = .top
        
        cityExplainLabel.font = .systemFont(ofSize: 12, weight: .medium)
        cityExplainLabel.textColor = .gray
        cityExplainLabel.textAlignment = .center
        cityExplainLabel.contentMode = .top
        cityExplainLabel.numberOfLines = 0
    }
    
    func configureData(_ item: City) {
        print(#function, item)

        cityImageView.kf.setImage(with: item.imageURL)
        cityNameLabel.text = item.city_name_kor_eng
        cityExplainLabel.text = item.city_explain
    }

}
