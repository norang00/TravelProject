//
//  CircleCityViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit

class CircleCityViewController: UIViewController {

    var cityList = CityInfo().city
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setSegmentedControlView()
        setCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "인기 도시"
        setNavigationAppearance()
    }
}

// Segmented Control 관련
extension CircleCityViewController {
    func setSegmentedControlView() {
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
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 170, height: 220)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.collectionViewLayout = layout
        
        /* [고민한 부분]
         layout 을 비율로 주었더니 너무 깨져서 한참 맞는 고정값을 찾아서 헤멨다.
         Xib 로 그린 셀 자체 크기와 여기서 지정하는 아이템 사이즈랑 뭐가 우선해서 적용되는걸까?
         수치를 여러가지 실험해봤는데 예상이랑 너무 다른 결과들만 나와서 실험 불가...
         */
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#function)

        return cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function, indexPath)

        let item = cityList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCityCollectionViewCell.identifier, for: indexPath) as! CircleCityCollectionViewCell
        cell.configureData(item)
        return cell
    }
    
    
    
    
}
