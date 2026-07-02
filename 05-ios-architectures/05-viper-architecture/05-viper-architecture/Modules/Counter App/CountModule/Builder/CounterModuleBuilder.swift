//
//  CounterBuilder.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 30/06/26.
//

import UIKit

final class CounterModuleBuilder {

    static func build() -> UIViewController {

        guard
            let view = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(
                    withIdentifier: "CounterViewController")
                as? CounterViewController
        else {
            return UIViewController()
        }

        let presenter = CounterPresenter()

        let interactor = CounterInteractor()

        let router = CounterRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return view
    }
}
