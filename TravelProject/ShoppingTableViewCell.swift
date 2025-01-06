//
//  ShoppingTableViewCell.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/4/25.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    static let identifier = "shoppingCell"

    @IBOutlet var itemBackgroundView: UIView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var itemTitleLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure() {
        tintColor = .black
        
        itemBackgroundView.layer.cornerRadius = 8
        itemBackgroundView.layer.backgroundColor = UIColor.shoppingBackground.cgColor
        
        checkButton.setTitle("", for: .normal)
        checkButton.imageView?.contentMode = .scaleAspectFit
        
        itemTitleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        
        starButton.setTitle("", for: .normal)
        starButton.imageView?.contentMode = .scaleAspectFit
    }
    
    func configureData(_ item: Shopping) {
        itemTitleLabel.text = item.itemTitle
        
        checkButton.setImage(UIImage(systemName: item.isChecked ? "checkmark.square.fill" : "checkmark.square"), for: .normal)
        
        starButton.setImage(UIImage(systemName: item.isStarred ? "star.fill" : "star"), for: .normal)
    }
    
}
