//
//  UIViewController+Extension.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit

extension UIViewController {
    
    func setNavigationAppearance() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = .white
        navigationAppearance.shadowColor = .lightGray
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.scrollEdgeAppearance = navigationAppearance
    }
}
