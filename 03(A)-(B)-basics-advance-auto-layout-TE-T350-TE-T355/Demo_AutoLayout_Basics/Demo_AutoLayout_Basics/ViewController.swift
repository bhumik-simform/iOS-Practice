//
//  ViewController.swift
//  Demo_AutoLayout_Basics
//
//  Created by Bhumik Poshiya on 12/03/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2.0
    }
    



}

