//
//  RestaurantViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/8/25.
//

import UIKit
import MapKit

class RestaurantViewController: UIViewController {

    @IBOutlet var filterButton: UIBarButtonItem!
    @IBOutlet var mapView: MKMapView!
    
    let restaurantList = RestaurantInfo().restaurant
    var categoryList: [String] = []
    var filteredList: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCategory()
        setFilter()
        setMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "창동 맛집"
        setNavigationAppearance()
        configureMapView(restaurantList)
    }
    
    func setCategory() {
        var categorySet: Set<String> = []
        for index in 0..<restaurantList.count {
            categorySet.insert(restaurantList[index].category)
        }
        categoryList = Array(categorySet).sorted()
    }
    
    func setFilter() {
        filterButton.title = "필터"
    }
    
    func filterData(_ category: String) -> [Restaurant] {
        return restaurantList.filter { $0.category == category }
    }
    
    @IBAction func filterButtonTapped(_ sender: UIBarButtonItem) {
        print(#function)
        showActionSheet()
    }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let action = UIAlertAction(title: "전체", style: .default) {_ in 
            self.configureMapView(self.restaurantList) // self 왜 자꾸 붙냐!
        }
        actionSheet.addAction(action)
        
        for index in 0..<categoryList.count {
            let action = UIAlertAction(title: categoryList[index], style: .default) {
                action in
                print("\(self.categoryList[index]) clicked")
                let filteredData = self.filterData(self.categoryList[index])
                self.configureMapView(filteredData)
            }
            actionSheet.addAction(action)
        }
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        present(actionSheet, animated: true, completion: nil)
    }
}

extension RestaurantViewController: MKMapViewDelegate {

    func setMapView() {
        mapView.delegate = self
        configureMapView(restaurantList)
    }
    
    func configureMapView(_ restaurantList: [Restaurant]) {
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
        
        let center = calculateCenter(restaurantList)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 250, longitudinalMeters: 250)
        mapView.addAnnotations(getAnnotations(restaurantList))
    }
    
    func calculateCenter(_ restaurantList: [Restaurant]) -> CLLocationCoordinate2D {
        var result: CLLocationCoordinate2D
        
        let latitudes: [Double] = restaurantList.map { $0.latitude }
        let longitudes: [Double] = restaurantList.map { $0.longitude }
        let sumLatitudes = latitudes.reduce(0, +)
        let sumLongitudes = longitudes.reduce(0, +)
        let averageLatitude = sumLatitudes/Double(restaurantList.count)
        let averageLongitude = sumLongitudes/Double(restaurantList.count)
        result = CLLocationCoordinate2D(latitude: averageLatitude, longitude: averageLongitude)

        return result
    }
    
    func getAnnotations(_ restaurantList: [Restaurant]) -> [MKPointAnnotation] {
        var annotationList: [MKPointAnnotation] = []
        
        for index in 0..<restaurantList.count {
            let item = restaurantList[index]
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
            annotation.title = item.name

            annotationList.append(annotation)
        }
        
        return annotationList
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let coordinate: CLLocationCoordinate2D = view.annotation!.coordinate
        mapView.region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
    }
    
}
