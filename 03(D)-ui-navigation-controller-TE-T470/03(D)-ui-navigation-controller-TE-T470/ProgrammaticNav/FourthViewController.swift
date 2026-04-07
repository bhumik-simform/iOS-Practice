//
//  FourthViewController.swift
//  03(D)-ui-navigation-controller-TE-T470
//
//  Created by Bhumik Poshiya on 07/04/26.
//

import UIKit
protocol MessageDelegate {
    func didTypeReply(text: String)
}
class FourthViewController: UIViewController {

    var delegate: MessageDelegate?
    @IBOutlet weak var dataTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        dataTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
}

extension FourthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        if let inputText = textField.text {
            delegate?.didTypeReply(text: inputText)
            self.navigationController?.popViewController(animated: true)
        }
       
        return true
    }
}


/*if let destinationVC = UIStoryboard(name: "ProgNav", bundle: nil).instantiateViewController(withIdentifier: "FinalViewController") as? FinalViewController  {
    destinationVC.showData = textField.text
    self.present(destinationVC, animated: true, completion: nil)
}*/
