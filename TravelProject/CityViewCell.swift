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
    
//    func configureData(_ item: City) {
//        cityImageView.kf.setImage(with: item.imageURL)
//        cityNameLabel.text = item.city_name_kor_eng
//        footerLabel.text = item.city_explain
//    }
    
    func configureData(_ item: City, _ searchText: String) {
        cityImageView.kf.setImage(with: item.imageURL)
        
        // 검색어가 있을 때 하이라이트 적용하기
        // NSMutableAttributedString : 해당 문자열의 특정 범위 속성 변경 가능!
        let attributedCityName = NSMutableAttributedString(string: item.city_name_kor_eng)
        let attributedCityExplain = NSMutableAttributedString(string: item.city_explain)

        let lowerCityName = item.city_name_kor_eng.lowercased() // 영어인 경우를 대비해 일단 다 소문자
        let lowerCityExplain = item.city_explain.lowercased()
        let lowerSearchText = searchText.lowercased() // 서치 텍스트도

        // NSRange(A, B) -> B 안에 있는 A 의 범위
        if !searchText.isEmpty {
            
            // 검색어가 제목에 일치하는 부분 있으면 표시
            if let range = lowerCityName.range(of: lowerSearchText) {
                let nsRange = NSRange(range, in: item.city_name_kor_eng)
                attributedCityName.addAttribute(.foregroundColor, value: UIColor.blue, range: nsRange)
                cityNameLabel.attributedText = attributedCityName
            }
            
            // 검색어가 설명에 일치하는 부분 있으면 표시
            if let range = lowerCityExplain.range(of: lowerSearchText) {
                let nsRange = NSRange(range, in: item.city_explain)
                attributedCityExplain.addAttribute(.foregroundColor, value: UIColor.blue, range: nsRange)
                footerLabel.attributedText = attributedCityExplain
            }
            
        } else {
            cityNameLabel.text = item.city_name_kor_eng
            footerLabel.text = item.city_explain
        }
    }
}
