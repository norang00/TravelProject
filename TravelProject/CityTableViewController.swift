//
//  CityTableViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/6/25.
//

import UIKit

class CityTableViewController: UITableViewController {
    
    var cityList = CityInfo().city
    var filteredList: [City] = []
    var isFiltering: Bool = false
    
    @IBOutlet var upperView: UIView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var filterSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredList = cityList
        
        setSearchBarView()
        searchBar.delegate = self

        setSegmentedControlView()
        
        let nib = UINib(nibName: "CityViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CityViewCell.identifier)

        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationItem.title = "인기 도시"
        setNavigationAppearance()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredList.count : cityList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = isFiltering ? filteredList[indexPath.row] : cityList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CityViewCell.identifier, for: indexPath) as! CityViewCell
        
        let searchText = searchBar.text?.trimmingCharacters(in: [" "]) ?? ""
        cell.configureData(item, searchText)

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

// Segmented Control 관련
extension CityTableViewController {
    
    func setSegmentedControlView() {
        let segmentTitles = ["모두", "국내", "해외"]
        for index in 0..<segmentTitles.count {
            filterSegmentedControl.setTitle(segmentTitles[index], forSegmentAt: index)
        }
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 12, weight: .bold)
        ]
        filterSegmentedControl.setTitleTextAttributes(selectedAttributes, for: .selected)
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

// SearchBar 관련
extension CityTableViewController: UISearchBarDelegate {
    
    func setSearchBarView() {
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "도시를 검색해 보세요!"
    }

    // 검색 창에 입력 중
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterBySearchInput(searchText)
    }

    // 검색 끝나고 엔터
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filterBySearchInput(searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }

    func filterBySearchInput(_ searchText: String) {
        let trimmedText = searchText.trimmingCharacters(in: [" "])
        if trimmedText.isEmpty {
            isFiltering = false
            filteredList = []
        } else {
            isFiltering = true
            filteredList = cityList.filter {
                $0.city_name.localizedCaseInsensitiveContains(trimmedText) ||
                $0.city_english_name.localizedCaseInsensitiveContains(trimmedText) ||
                $0.city_explain.localizedCaseInsensitiveContains(trimmedText)
            }
        }
        tableView.reloadData()
    }
    
}
