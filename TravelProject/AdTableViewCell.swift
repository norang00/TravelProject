//
//  AdTableViewCell.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    
    static let identifier = "adCell"

    @IBOutlet var adContentView: UIView!
    @IBOutlet var adContentLabel: UILabel!
    @IBOutlet var adBadgeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure() {
        adContentView.layer.cornerRadius = 8
        
        adContentLabel.font = .systemFont(ofSize: 14, weight: .black)
        adContentLabel.textAlignment = .center
        adContentLabel.numberOfLines = 2

        adBadgeLabel.text = "AD"
        adBadgeLabel.font = .systemFont(ofSize: 10, weight: .semibold)
        adBadgeLabel.textAlignment = .center
        adBadgeLabel.layer.cornerRadius = 8
        adBadgeLabel.layer.backgroundColor = UIColor.white.cgColor
    }
    
    func configureData(_ item: Travel) {
        adContentLabel.text = item.title
    }
}
