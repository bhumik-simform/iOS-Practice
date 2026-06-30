//
//  UserTabBarViewController.swift
//  05-mvvm-architecture
//
//  Created by Bhumik Poshiya on 30/06/26.
//

import UIKit

final class UserTabBarController: UITabBarController {

    var userId: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTab()
        // Do any additional setup after loading the view.
    }

    private func configureTab() {

        guard
            let taskViewController = viewControllers?.first
                as? UserTasksViewController
        else {
            return
        }

        taskViewController.userId = userId
    }
}
