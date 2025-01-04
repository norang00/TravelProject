//
//  MagazineTableViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {

    let magazineList = MagazineInfo().magazine

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SeSAC TRAVEL"
    }

    // didSelectedRowAt 메서드가 아니더라도
    // Cell의 액션을 정의하고 화면전환 데이터전달 다 할 수 있다니 정말 편리하군...
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedCell = sender as! UITableViewCell
        let index = selectedCell.tag

        if segue.identifier == "webViewSegue" {
            if let destination = segue.destination as? WebViewController {
                destination.urlString = magazineList[index].link
            }
        }
    }
        
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "magazineCell", for: indexPath) as! MagazineTableViewCell
        
        let item = magazineList[indexPath.row]
        let imageURL = URL(string: item.photo_image)

        cell.magazineImageView.kf.setImage(with: imageURL)
        cell.magazineImageView.contentMode = .scaleAspectFill
        cell.magazineImageView.layer.cornerRadius = 16

        cell.magazineTitleLabel.text = item.title
        cell.magazineTitleLabel.textColor = .black
        cell.magazineTitleLabel.textAlignment = .left
        cell.magazineTitleLabel.font = .systemFont(ofSize: 20, weight: .black)
        cell.magazineTitleLabel.numberOfLines = 2
        
        cell.magazineSubtitleLabel.text = item.subtitle
        cell.magazineSubtitleLabel.textColor = .lightGray
        cell.magazineSubtitleLabel.textAlignment = .left
        cell.magazineSubtitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        cell.magazineSubtitleLabel.numberOfLines = 1
        
        let date = item.date.map { String($0) }
        let dateText = "\(date[0]+date[1])년 \(date[2]+date[3])월 \(date[4]+date[5])일"
        /* [고민한 부분]
         String 을 분할해서 Char 배열로 만들어서 반복문을 돌린다든가,
         String Extension 을 만들어서 DateFormatter를 역으로 처리한다거나,
         여러 방법 생각해봤는데 이게 제일 간단하게 두줄만에 끝나는거 같다.
         허술하고 간단해 보여도 주어진 데이터에 가장 적합한 처리 방법인 것 같기도...?
         문자열 처리하는 방법을 여러가지 알아 볼 수 있어서 좋았다!
         */
        
        cell.magazineDateLabel.text = dateText
        cell.magazineDateLabel.textColor = .lightGray
        cell.magazineDateLabel.textAlignment = .right
        cell.magazineDateLabel.font = .systemFont(ofSize: 14, weight: .bold)
        cell.magazineDateLabel.numberOfLines = 1
        
        cell.tag = indexPath.row
        return cell
    }
    
}
