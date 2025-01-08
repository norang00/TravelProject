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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFilter()
        setMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "창동 맛집"
        setNavigationAppearance()
    }
    
    func setFilter() {
        filterButton.title = "필터"
    }
    
    @IBAction func filterButtonTapped(_ sender: UIBarButtonItem) {
        
        print(#function)
    }
    
}

extension RestaurantViewController: MKMapViewDelegate {

    func setMapView() {
        mapView.delegate = self
        configureMapView()
    }
    
    func configureMapView() {
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.addAnnotations(getAnnotations())
    }
    
    func getAnnotations() -> [MKPointAnnotation] {
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
    
}
