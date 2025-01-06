//
//  TravelTableViewCell.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit
import Kingfisher

class TravelTableViewCell: UITableViewCell {
    
    static let identifier = "travelCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var detailInfoLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var starImageViews: [UIImageView]!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure() {
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        descriptionLabel.textColor = .gray
        descriptionLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.frame.size = descriptionLabel.intrinsicContentSize

        detailInfoLabel.textColor = .lightGray
        detailInfoLabel.font = .systemFont(ofSize: 12, weight: .bold)
        
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = 6
        
        likeButton.setTitle("", for: .normal)
        likeButton.imageView?.contentMode = .scaleAspectFit
    }
    
    func configureData(_ item: Travel) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        detailInfoLabel.text = item.detailInfo
        cityImageView.kf.setImage(with: item.imageURL)
        setReview(item.grade ?? 0)
    }
    
    func setReview(_ grade: Double) {
        var grade = grade
        for index in 0..<5 {
            if grade >= 1 {
                starImageViews[index].image = UIImage(named: "yellowStar")
            } else {
                starImageViews[index].image = UIImage(named: "grayStar")
            }
            starImageViews[index].contentMode = .scaleAspectFit
            grade -= 1
        }
    }
}
