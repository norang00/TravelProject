//
//  AdViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/7/25.
//

import UIKit

class AdViewController: UIViewController {
    
    static var identifier = "AdViewController"
    
    @IBOutlet var xBarButtonItem: UIBarButtonItem!
    @IBOutlet var contentLabel: UILabel!
    
    var travelCity: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "광고화면"
        setNavigationAppearance()
        setNavigationItem()
        setView()
    }
    
    func setNavigationItem() {
        xBarButtonItem.image = UIImage(systemName: "xmark")
    }
    
    func setView() {
        contentLabel.text = travelCity?.title
        contentLabel.textAlignment = .center
        contentLabel.font = .systemFont(ofSize: 24, weight: .black)
        contentLabel.numberOfLines = 0
    }

    @IBAction func xButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
