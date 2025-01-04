//
//  TravelTableViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    let travelList = TravelInfo().travel
    let adColorList = [UIColor.adColor1, UIColor.adColor2]
    var adCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "도시 상세 정보"

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = travelList[indexPath.row]
        
        if item.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "adCell", for: indexPath) as! AdTableViewCell
            cell.adContentView.layer.cornerRadius = 8
            cell.adContentView.layer.backgroundColor = adColorList[adCount%2].cgColor

            cell.adContentLabel.text = item.title
            cell.adContentLabel.font = .systemFont(ofSize: 14, weight: .black)
            cell.adContentLabel.textAlignment = .center
            cell.adContentLabel.numberOfLines = 2

            cell.adBadgeLabel.text = "AD"
            cell.adBadgeLabel.font = .systemFont(ofSize: 10, weight: .semibold)
            cell.adBadgeLabel.textAlignment = .center
            cell.adBadgeLabel.layer.cornerRadius = 8
            cell.adBadgeLabel.layer.backgroundColor = UIColor.white.cgColor

            cell.separatorInset.left = cell.bounds.width * 1.5
            adCount += 1
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelTableViewCell
            
            cell.titleLabel.text = item.title
            cell.titleLabel.textColor = .black
            cell.titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
            
            cell.descriptionLabel.text = item.description
            cell.descriptionLabel.textColor = .gray
            cell.descriptionLabel.font = .systemFont(ofSize: 13, weight: .semibold)
            cell.descriptionLabel.numberOfLines = 0
            cell.descriptionLabel.frame.size = cell.descriptionLabel.intrinsicContentSize
            cell.detailInfoLabel.text = "★★★★★ (\(item.grade!)) ･ 저장 \(item.save!.formatted())"
            cell.detailInfoLabel.textColor = .lightGray
            cell.detailInfoLabel.font = .systemFont(ofSize: 12, weight: .bold)
                        
            if let imageURL = URL(string: item.travel_image ?? "no image") {
                cell.cityImageView.kf.setImage(with: imageURL)
            } else {
                cell.cityImageView.image = UIImage(named: "defaultImage")
            }
            cell.cityImageView.contentMode = .scaleAspectFill
            cell.cityImageView.layer.cornerRadius = 6

            if let isLike = item.like {
                cell.likeButton.setTitle("", for: .normal)
                cell.likeButton.setImage(UIImage(named: isLike ? "filledHeart" : "emptyHeart"), for: .normal)
                cell.likeButton.imageView?.contentMode = .scaleAspectFit
            }
            
            if indexPath.row+1 != travelList.count {
                print("index \(indexPath.row) count \(travelList.count)")
                if travelList[indexPath.row+1].ad {
                    cell.separatorInset.left = cell.bounds.width * 1.5
                }
            }
            /* [고민되는 부분]
             다음 카드가 ad 면 seperator 의 left inset 을 밀어버려서 안보이게 하고 있는데,
             다음 카드를 확인할때마다 결국 한번씩 리스트 인덱스를 또 가져와서 확인해야 하는 것이 조금 덜 효율적으로 느껴진다.
             하나의 Cell 을 그릴때마다 결국 두개의 데이터를 확인하고 있는 셈이어서 그렇게 보이는 것 같다.
             다음 데이터의 특정 부분만 엿보고 싶을때 쓸 수 잇는 방법이 없을까??
             */
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = travelList[indexPath.row]
        
        if item.ad {
            return 66
        } else {
            return 135
        }
        
    }

}
