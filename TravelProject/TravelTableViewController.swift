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
        /* [고민한 부분] - adView 색상 고정
         tableView.reloadData() 했더니 영향주고 싶지 않은 adView 도 색이 자꾸 바뀌어서
         특정 row 만 다시 로드하는 방법을 찾아서 적용해보았다. adView 색 문제가 아니더라도 지금 뷰는 정보가 고정되어 있어서 적절한 방법인 것 같다.
         지금은 section 이 나뉘어져있지 않아서 이렇게 할 수 있는데, 나중에 section 도 나뉘면 어떻게하지?
         tag에 붙여서 작성하고 여기서 분해하는 작업을 해주어야 할까?
         그거랑 별개로 애초에 adView 의 색상을 이렇게 count 로 적용하는게 별로 좋은 방법은 아닌 것 같긴 한데...
         */
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
            
            /* [고민한 부분] - adView 색상 고정
             스크롤 할때마다도 adView 색상이 자꾸 바뀌는걸 발견했다.
             count 변수 자체는 가장 처음에만 초기화되고 광고가 화면에 나올때마다 카운트 되기 때문에 그런 것 같다.
             현재 광고가 3가지 있는데 카운트는 하나씩 올라가니까, 스크롤을 한번 내렸다 올린다고 생각한다면 화면에 그려지는 순서를 계산해서 짝수, 홀수 일때 계산해주면 되겠지? 라고 생각했는데, 잘못된 생각이었다.

             cell.adContentView.layer.backgroundColor = adColorList[adCount%2].cgColor
             adCount += 1

             (예상) 광고표시/adCount 순서: (첫번째/0)-(두번째/1)-(세번째/2)-(두번째/3)-(첫번째/4)
             (실제) 광고표시/adCount 순서: (첫번째/0)-(두번째/1)-(세번째/2)-*(첫번째/3)*-(두번째/4)
             (이슈) 두번째 광고는 화면에 남아있는 상태이기 때문에 다시 로드되지 않았다. 그래서 홀짝 전략은 실패로 돌아갔다.
             대신 세 광고가 한가지 순서로 패턴이 반복된다는 것을 알아냈기 때문에, 3으로 나눠서 그 나머지의 홀짝을 다시 계산해주었다.

             cell.adContentView.layer.backgroundColor = adColorList[(adCount%3)%2].cgColor
             adCount += 1

             (이슈) 그런데 다른 탭 들렀다가 오면 여행 탭에서 보고 있던 화면 자체는 남아있기 때문에, 어느 광고를 보고 있었는지에 따라서 카운팅이 꼬이게 된다.
             두번째 광고를 보고있다가 다른 탭 갔다 오면 두번째는 그대로 있고 새로 로드되는 부분부터 카운팅이 시작되기 때문에 고정해 줄 수가 없다.
             아무리 생각해도 이렇게 색 지정하는건 좀 아닌 것 같아서 아예 그냥 tag 로 지정해서 나머지를 이용해서 색을 고정했다.
             */

            // tag 값이 들어있지 않을때는 기본값으로 0 이 들어있다. 세가지 광고에 1,2,3을 넣어준다.
            if cell.tag == 0 {
                cell.tag = adCount+1 // tag 디폴트가 0 이니까 1부터 넣어준다.
                adCount += 1
            }
            cell.adContentView.layer.backgroundColor = adColorList[(cell.tag-1)%2].cgColor
            
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
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelTableViewCell
            
            cell.titleLabel.text = item.title
            cell.titleLabel.textColor = .black
            cell.titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
            
            var grade = item.grade ?? 0
            for index in 0..<5 {
                if grade >= 1 {
                    cell.starImageViews[index].image = UIImage(named: "yellowStar")
                } else {
                    cell.starImageViews[index].image = UIImage(named: "grayStar")
                }
                cell.starImageViews[index].contentMode = .scaleAspectFit
                grade -= 1
            }
            
            cell.descriptionLabel.text = item.description
            cell.descriptionLabel.textColor = .gray
            cell.descriptionLabel.font = .systemFont(ofSize: 13, weight: .semibold)
            cell.descriptionLabel.numberOfLines = 0
            cell.descriptionLabel.frame.size = cell.descriptionLabel.intrinsicContentSize
            cell.detailInfoLabel.text = "(\(item.grade!)) ･ 저장 \(item.save!.formatted())"
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
                cell.likeButton.tag = indexPath.row
                cell.likeButton.setTitle("", for: .normal)
                cell.likeButton.setImage(UIImage(named: isLike ? "filledHeart" : "emptyHeart"), for: .normal)
                cell.likeButton.imageView?.contentMode = .scaleAspectFit
                cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            }
            
            let nextIndex = indexPath.row + 1
            cell.separatorInset.left = 20.0 // Inset 한번씩 초기화해주어야 함
            if nextIndex < travelList.count, travelList[nextIndex].ad {
                cell.separatorInset.left = cell.bounds.width * 1.5
            }
            /* [고민되는 부분]
             다음 카드가 ad 면 seperator 의 left inset 을 밀어버려서 안보이게 하고 있는데,
             다음 카드를 확인할때마다 결국 한번씩 리스트 인덱스를 또 가져와서 확인해야 하는 것이 조금 덜 효율적으로 느껴진다.
             하나의 Cell 을 그릴때마다 결국 두개의 데이터를 확인하고 있는 셈이어서 그런 것 같다.
             다음 데이터의 특정 부분만 엿보고 싶을때 쓸 수 잇는 방법이 없을까??
             + 테이블뷰에서는 Cell 재사용의 특성 때문에 반복문을 통해서 설정을 조절하는 것이 어렵다는 것을 알았다.
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
