//
//  CounterRouter.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 30/06/26.
//

import UIKit

final class CounterRouter: CounterRouterProtocol {

    weak var delegate: CounterRouterDelegate?

    func navigateToColorPicker() {
        delegate?.routeToColorPicker()
    }
}
