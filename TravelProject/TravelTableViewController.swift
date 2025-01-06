//
//  TravelTableViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    
    var travelList = TravelInfo().travel
    let adColorList = [UIColor.adColor1, UIColor.adColor2]
    var adCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "도시 상세 정보"
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        travelList[sender.tag].like?.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = travelList[indexPath.row]
                
        if item.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier, for: indexPath) as! AdTableViewCell
            
            if cell.tag == 0 {
                cell.tag = adCount+1
                adCount += 1
            }
            cell.adContentView.layer.backgroundColor = adColorList[(cell.tag-1)%2].cgColor
            cell.separatorInset.left = cell.bounds.width * 1.5
            
            cell.configureData(item)

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell

            if let isLike = item.like {
                cell.likeButton.tag = indexPath.row
                cell.likeButton.setImage(UIImage(named: isLike ? "filledHeart" : "emptyHeart"), for: .normal)
                cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            }
            
            let nextIndex = indexPath.row + 1
            cell.separatorInset.left = 20.0
            if nextIndex < travelList.count, travelList[nextIndex].ad {
                cell.separatorInset.left = cell.bounds.width * 1.5
            }
            
            cell.configureData(item)
            
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
