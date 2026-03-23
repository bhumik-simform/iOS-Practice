//
//  AndroidViewController.swift
//  Demo_UI_Elements_2
//
//  Created by Bhumik Poshiya on 26/03/26.
//

import UIKit
import WebKit

class IOSViewController: UIViewController {
    @IBOutlet weak var iOSWebSpinner: UIActivityIndicatorView!
    @IBOutlet weak var iOSWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webPageLoader()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        webPageLoader()
    }
    
    func webPageLoader() {
        iOSWebSpinner.startAnimating()
        iOSWebView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            guard let currURL = URL(string: "https://en.wikipedia.org/wiki/IOS") else {
                return
            }
            let urlRequest = URLRequest(url: currURL)
            self.iOSWebSpinner.stopAnimating()
            self.iOSWebView.isHidden = false
            self.iOSWebView.load(urlRequest)
       }
    }
}



