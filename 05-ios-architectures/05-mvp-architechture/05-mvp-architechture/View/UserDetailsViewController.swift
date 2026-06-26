//
//  UserDetailsViewController.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 26/06/26.
//

import UIKit

class UserDetailsViewController: UIViewController {

    
    @IBOutlet private weak var firstNameLabel: UILabel!
    
    
    var userDetails: LogInResponse?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let userDetails {
            firstNameLabel.text = userDetails.firstName
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
