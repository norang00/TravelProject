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
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = cityImageView.frame.height/2 + 12
        /* [고민되는 부분]
         이미지뷰 비율을 1:1 로 주고, radius 를 이미지뷰의 반으로 지정했는데도 완벽한 구형이 나오지 않음
         조금씩 숫자를 늘려가면서 그나마 비슷한 형태를 찾았지만 딱 들어맞지는 않는다.
         */
        
        cityNameLabel.font = .systemFont(ofSize: 16, weight: .black)
        cityNameLabel.textColor = .black
        cityNameLabel.textAlignment = .center
        cityNameLabel.contentMode = .top
        
        cityExplainLabel.font = .systemFont(ofSize: 12, weight: .medium)
        cityExplainLabel.textColor = .gray
        cityExplainLabel.textAlignment = .center
        cityExplainLabel.numberOfLines = 0
        cityExplainLabel.contentMode = .top
        /* [고민되는 부분]
         contentMode 를 top 으로 주었는데도 라벨 안에 한 줄만 있을 때 중간에 정렬되어 버림
         contentMode 말고 다른 방법이 있나 찾아봐야 함.
         */
    }
    
    func configureData(_ item: City, _ searchText: String) {
        cityImageView.kf.setImage(with: item.imageURL)
        
        // 검색어가 있을 때 하이라이트 적용하기
        // NSMutableAttributedString : 해당 문자열의 특정 범위 속성 변경 가능!
        let attributedCityName = NSMutableAttributedString(string: item.city_name_kor_eng)
        let attributedCityExplain = NSMutableAttributedString(string: item.city_explain)

        let lowerCityName = item.city_name_kor_eng.lowercased() // 영어인 경우를 대비해 다 소문자
        let lowerCityExplain = item.city_explain.lowercased()
        let lowerSearchText = searchText.lowercased() // 서치 텍스트도

        if !searchText.isEmpty {
            
            var searchRangeName = lowerCityName.startIndex..<lowerCityName.endIndex
            while let range = lowerCityName.range(of: lowerSearchText, range: searchRangeName) {
                let nsRange = NSRange(range, in: item.city_name_kor_eng)
                attributedCityName.addAttribute(.foregroundColor, value: UIColor.blue, range: nsRange)
                searchRangeName = range.upperBound..<lowerCityName.endIndex
            }
            cityNameLabel.attributedText = attributedCityName
            
            var searchRangeExplain = lowerCityExplain.startIndex..<lowerCityExplain.endIndex
            while let range = lowerCityExplain.range(of: lowerSearchText, range: searchRangeExplain) {
                let nsRange = NSRange(range, in: item.city_explain)
                attributedCityExplain.addAttribute(.foregroundColor, value: UIColor.blue, range: nsRange)
                searchRangeExplain = range.upperBound..<lowerCityExplain.endIndex
            }
            cityExplainLabel.attributedText = attributedCityExplain
            
        } else {
            cityNameLabel.text = item.city_name_kor_eng
            cityExplainLabel.text = item.city_explain
        }
        /* [고민되는 부분]
         위와 같이 특정 문자열의 특정 부분 범위를 도출하는 과정에서, 첫번째 값만 가지고 오는 것이 확인되었다.
         예를 들어, "지"를 검색한다고 했을 때, [섭지코지] 라는 단어에서는 처음 나오는 "지"글자만 색이 변한다.
         따라서, 문자열 인덱스를 확인하여 마지막 문자열까지 글자속성을 바꿔주도록 반복문을 추가하였다.
         */
        
    }

}
