//
//  MsgVC.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 06/04/26.
//

import UIKit

class MsgVC: UIViewController {

    var userName: String?
       
       @IBOutlet weak var messageLbl: UILabel!
       
       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
           if let userName {
               messageLbl.text = "Hello! \(userName)"
           }
       }

}
