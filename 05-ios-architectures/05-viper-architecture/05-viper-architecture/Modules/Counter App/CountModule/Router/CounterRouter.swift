//
//  CounterRouter.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 30/06/26.
//

import UIKit

final class CounterRouter: CounterRouterProtocol {
    
    weak var viewController: UIViewController?
    
    func navigateToColorPicker() {
        
        let destinationVC = ColorPickerModuleBuilder.build()
        
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
