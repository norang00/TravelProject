//
//  CityTableViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/6/25.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    var cityList = CityInfo().city
    
    @IBOutlet var upperView: UIView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var filterSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "인기 도시"
        tableView.separatorStyle = .none

        setUpperView()
        
        let nib = UINib(nibName: "CityViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CityViewCell.identifier)
    }
    
    func setUpperView() {
        searchBar.searchBarStyle = .minimal
        
        let segmentTitles = ["모두", "국내", "해외"]
        for index in 0..<segmentTitles.count {
            filterSegmentedControl.setTitle(segmentTitles[index], forSegmentAt: index)
        }
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12, weight: .bold)
        ]
        filterSegmentedControl.setTitleTextAttributes(selectedAttributes, for: .selected)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = cityList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CityViewCell.identifier, for: indexPath) as! CityViewCell
        cell.configureData(item)

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    @IBAction func filterSegmentedControl(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let fullList = CityInfo().city
        
        switch index {
        case 0:
            cityList = fullList
        case 1:
            cityList = fullList.filter { $0.domestic_travel }
        case 2:
            cityList = fullList.filter { !$0.domestic_travel }
        default:
            print("segmentedControl default")
        }
        tableView.reloadData()
    }
    
}

/* [고민되는 부분]
 슬슬 버벅이기 시작한다.
 로딩이 약간 느리더라도 예쁜 상태로 화면에 나타났으면 좋겠는데.
 뷰 표시 순서라든가 바꿀 수 없나?
 */
