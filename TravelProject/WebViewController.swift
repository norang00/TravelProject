//
//  WebViewController.swift
//  TravelProject
//
//  Created by Kyuhee hong on 1/3/25.
//

import UIKit
import WebKit

// 블로그 따라해보기! 김종권님 늘 감사합니다...
// https://ios-development.tistory.com/470
class WebViewController: UIViewController {
    
    static var identifier = "WebViewController"

    @IBOutlet var webView: WKWebView!
    var urlString: String = "https://www.naver.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage(urlString)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title = ""
        setNavigationAppearance()
    }

    private func loadWebPage(_ url: String) {
        guard let myUrl = URL(string: url) else {
            print(#function, "URL 변환 실패")
            return
        }
        let request = URLRequest(url: myUrl)
        webView.load(request)
    }

}
