//
//  DetailViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    static var identifier = "DetailViewController"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    
    var travelCity: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "관광지 화면"
        navigationController?.navigationBar.topItem?.title = ""
        
        setView()
    }
    
    func setView() {
        imageView.kf.setImage(with: travelCity?.imageURL)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        
        titleLabel.text = travelCity?.title
        titleLabel.font = .systemFont(ofSize: 48, weight: .black)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.frame.size = titleLabel.intrinsicContentSize
        
        descriptionLabel.text = travelCity?.description
        descriptionLabel.font = .systemFont(ofSize: 24, weight: .black)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.frame.size = descriptionLabel.intrinsicContentSize
        
        backButton.setTitle("다른 관광지 보러 가기", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.titleLabel?.textAlignment = .center
        backButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        backButton.titleLabel?.numberOfLines = 0
        backButton.layer.cornerRadius = backButton.frame.height/2
        backButton.layer.backgroundColor = UIColor.button.cgColor
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
