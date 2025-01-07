//
//  UIViewController+Extension.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit

extension UIViewController {
    
    func setNavigationAppearance() {
        navigationController?.navigationBar.tintColor = .black

        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = .white
        navigationAppearance.shadowColor = .lightGray
        navigationController?.navigationBar.scrollEdgeAppearance = navigationAppearance
    }
}
