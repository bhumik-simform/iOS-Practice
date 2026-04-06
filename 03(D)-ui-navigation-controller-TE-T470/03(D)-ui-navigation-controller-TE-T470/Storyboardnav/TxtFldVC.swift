//
//  TxtFldVC.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 03/04/26.
//

import UIKit

class TxtFldVC: UIViewController {

    @IBOutlet weak var myUITextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        myUITextField.delegate = self
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userName" {
            if let destinationVC = segue.destination as? MsgVC {
                destinationVC.userName = myUITextField.text
            }
        }
    }
}

extension TxtFldVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        performSegue(withIdentifier: "userName", sender: self)
        return true
    }

}
