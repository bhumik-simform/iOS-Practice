//
//  ViewController.swift
//  Demo_UI_Elements_2
//
//  Created by Bhumik Poshiya on 25/03/26.
//

import UIKit
import WebKit

class ActivityIndicatorViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadPageButton: UIButton!
    //@IBOutlet weak var loadPageSpinner: UIActivityIndicatorView!
    let loadPageSpinner: UIActivityIndicatorView = {
        let tempSpinner = UIActivityIndicatorView(style: .large)
        tempSpinner.translatesAutoresizingMaskIntoConstraints = false
        return tempSpinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UISetup()
   
    }

    func UISetup() {
        view.backgroundColor = .systemBackground
        view.addSubview(loadPageSpinner)
        
        NSLayoutConstraint.activate([
            loadPageSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadPageSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @IBAction func loadPageButton(_ sender: Any) {
        loadPage("https://www.google.com")
    }
    
    
    func loadPage(_ urlStr: String) {
        self.loadPageButton.isEnabled = false
        self.loadPageSpinner.startAnimating()
        self.webView.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            guard let currURL = URL(string: urlStr) else {
                return
            }
            let urlRequest = URLRequest(url: currURL)
            self.webView.load(urlRequest)
            self.loadPageSpinner.stopAnimating()
            self.webView.isHidden = false
            self.loadPageButton.isEnabled = true
        }
    }
}

