//
//  AndroidViewController.swift
//  Demo_UI_Elements_2
//
//  Created by Bhumik Poshiya on 26/03/26.
//

import UIKit
import WebKit

class AndroidViewController: UIViewController {
    
    @IBOutlet weak var androidWebView: WKWebView!
    @IBOutlet weak var androidWebSpinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webPageLoader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        webPageLoader()
    }
    
    func webPageLoader() {
        androidWebSpinner.startAnimating()
        androidWebView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            guard let currURL = URL(string: "https://en.wikipedia.org/wiki/Android_(operating_system)") else {
                return
            }
            let urlRequest = URLRequest(url: currURL)
            self.androidWebView.isHidden = false
            self.androidWebSpinner.stopAnimating()
            self.androidWebView.load(urlRequest)
       }
    }
}
