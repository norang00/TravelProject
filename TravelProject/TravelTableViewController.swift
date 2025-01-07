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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "도시 상세 정보"
        setNavigationAppearance()
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        vc.travelCity = travelList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
