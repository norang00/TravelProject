//
//  MagazineTableViewCell.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit
import Kingfisher

class MagazineTableViewCell: UITableViewCell {
    
    static let identifier = "magazineCell"

    @IBOutlet var magazineImageView: UIImageView!
    @IBOutlet var magazineTitleLabel: UILabel!
    @IBOutlet var magazineSubtitleLabel: UILabel!
    @IBOutlet var magazineDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        magazineImageView.image = Magazine.defaultImage
    }
    
    func configure() {
        magazineImageView.contentMode = .scaleAspectFill
        magazineImageView.layer.cornerRadius = 12

        magazineTitleLabel.textColor = .black
        magazineTitleLabel.textAlignment = .left
        magazineTitleLabel.font = .systemFont(ofSize: 20, weight: .black)
        magazineTitleLabel.numberOfLines = 2
        
        magazineSubtitleLabel.textColor = .lightGray
        magazineSubtitleLabel.textAlignment = .left
        magazineSubtitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        magazineSubtitleLabel.numberOfLines = 1

        magazineDateLabel.textColor = .lightGray
        magazineDateLabel.textAlignment = .right
        magazineDateLabel.font = .systemFont(ofSize: 14, weight: .bold)
        magazineDateLabel.numberOfLines = 1
    }
    
    func configureData(_ item: Magazine) {
        magazineImageView.kf.setImage(with: item.imageURL)
        magazineTitleLabel.text = item.title
        magazineSubtitleLabel.text = item.subtitle
        magazineDateLabel.text = item.formattedDate
    }
}
