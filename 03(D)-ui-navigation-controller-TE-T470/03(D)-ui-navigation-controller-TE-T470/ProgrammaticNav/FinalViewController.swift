//
//  FourthViewController.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 06/04/26.
//

import UIKit

class FinalViewController: UIViewController {

    
    @IBOutlet weak var ResultLbl: UILabel!
    
    var showData: String?
    var delegate: MessageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let showData {
            ResultLbl.text = showData
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showResultOnOrangeVC(_ sender: UIButton) {
       
    }
    
    @IBAction func showResultOnRootVC(_ sender: UIButton) {
        if let showData {
            delegate?.didTypeReply(text: showData)
        }
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
