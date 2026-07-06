//
//  ColorPickerRouter.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 02/07/26.
//
import UIKit

final class ColorPickerRouter: ColorPickerRouterProtocol {

    weak var delegate: ColorPickerRouterDelegate?

    func goBackToCounter() {
        delegate?.routeBackToCounter()
    }
}
