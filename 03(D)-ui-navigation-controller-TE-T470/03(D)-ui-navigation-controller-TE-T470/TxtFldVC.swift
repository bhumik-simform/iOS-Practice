//
//  TxtFldVC.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 03/04/26.
//

import UIKit

class TxtFldVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myUITextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        myUITextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        navigationController?.popViewController(animated: true)
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToHome" {
            if let destinationVC = segue.destination as? HomeVC {
                destinationVC.details = "Meow"
            }
        }
    }
}
