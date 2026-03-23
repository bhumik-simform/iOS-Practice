//  CountryInfoViewController.swift
//  Demo_UI_Elements_2
//
//  Created by Bhumik Poshiya on 26/03/26.
//

import UIKit
import WebKit

class CountryInfoViewController: UIViewController {
    @IBOutlet weak var countryInfoWebView: WKWebView!
    @IBOutlet weak var webLoadActivitySpinner: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        loadWebPage(for: AppSate.sahred.selectedCountry)
        countryInfoWebView.navigationDelegate = self
    }
    
    func loadWebPage(for countryName: String) {
        guard let currURL = URL(string: "https://en.wikipedia.org/wiki/\(countryName)") else {
            return
        }
        countryInfoWebView.load(URLRequest(url: currURL))
        if countryInfoWebView.isLoading {
            countryInfoWebView.isHidden = true
            webLoadActivitySpinner.startAnimating()
        }
    }
}

extension CountryInfoViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.webLoadActivitySpinner.stopAnimating()
        countryInfoWebView.isHidden = false
    }
}

