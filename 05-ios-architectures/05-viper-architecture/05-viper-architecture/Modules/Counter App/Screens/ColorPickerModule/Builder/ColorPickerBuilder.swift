//
//  ColorPickerBuilder.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 02/07/26.
//

import UIKit

final class ColorPickerModuleBuilder {

    static func build(routerDelegate: ColorPickerRouterDelegate) -> UIViewController {

        guard
            let view = UIStoryboard(name: "CounterApp", bundle: nil)
                .instantiateViewController(
                    withIdentifier: "ColorPickerViewController")
                as? ColorPickerViewController
        else {
            return UIViewController()
        }

        let presenter = ColorPickerPresenter()

        let interactor = ColorPickerInteractor()

        let router = ColorPickerRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.delegate = routerDelegate

        return view
    }
}
