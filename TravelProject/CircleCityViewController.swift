//
//  CircleCityViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit

class CircleCityViewController: UIViewController {

    var cityList = CityInfo().city
    var filteredList: [City] = []
    var isFiltering: Bool = false

    var searchController: UISearchController!
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setSearchBar()
        setSegmentedControl()
        setCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "인기 도시"
        setNavigationAppearance()
    }
}

// Search Bar 관련
// https://devmjun.github.io/archive/SearchController
// 참조한 튜토리얼 블로그
extension CircleCityViewController: UISearchResultsUpdating {
    
    func checkFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func setSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "도시를 검색해보세요"
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
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
        collectionView.reloadData()
    }
    
}

// Segmented Control 관련
extension CircleCityViewController {
    
    func setSegmentedControl() {
        print(#function)
        segmentedControl.removeAllSegments()

        let segmentTitles = ["모두", "국내", "해외"]
        for index in 0..<segmentTitles.count {
            segmentedControl.insertSegment(withTitle: segmentTitles[index], at: index, animated: true)
        }
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .bold)
        ]
        segmentedControl.setTitleTextAttributes(selectedAttributes, for: .selected)
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
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
        
        filterContentForSearchText(searchController.searchBar.text!)
        collectionView.reloadData()
    }
}

// Collection View 관련
extension CircleCityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setCollectionView() {
        print(#function)

        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: CircleCityCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CircleCityCollectionViewCell.identifier)
        
        setCollectionViewLayout()
    }
    
    func setCollectionViewLayout() {
        print(#function)

        let layout = UICollectionViewFlowLayout()
        let sectionSpacing: CGFloat = 20
        let itemSpacing: CGFloat = 12
        let width: CGFloat = UIScreen.main.bounds.width - itemSpacing - (sectionSpacing*2)
        let itemWidth: CGFloat = width / 2
        
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth*1.4)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: itemSpacing, left: sectionSpacing, bottom: itemSpacing, right: sectionSpacing)
        layout.minimumLineSpacing = itemSpacing
        layout.minimumInteritemSpacing = itemSpacing
        
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isFiltering ? filteredList.count : cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = isFiltering ? filteredList[indexPath.row] : cityList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCityCollectionViewCell.identifier, for: indexPath) as! CircleCityCollectionViewCell
        
        let searchText = searchController.searchBar.text?.trimmingCharacters(in: [" "]) ?? ""
        cell.configureData(item, searchText)
        
        return cell
    }
    
}
