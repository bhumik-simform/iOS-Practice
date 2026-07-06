//
//  CounterProtocol.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 30/06/26.
//

import UIKit

// View -> Presenter -> Interator
// Interator -> Presenter (If exists) -> View (If exists) there fore we inherite AnyObject Protocol so that we can make weakly couples relation

// Naming of protocol Purpose, Who Owns Implementation
// Uses or make refernces of protocol -> Implementes required methods of Protocol

// Purpose: ColorPick, Where will Implemenet: In Presenter, View -> Presenter
protocol ColorPickerPresenterProtocol {
    func viewDidLoad()
    func redTapped()
    func blackTapped()
    func blueTapped()
    func greenTapped()
    func goBackCounterTapped()
}

// Purpose: ColorPick, Where will Implemenet: In Interator, Presenter -> Interator
protocol ColorPickerInteractorProtocol {
    func changeColorToRed()
    func changeColorToBlack()
    func changeColorToBlue()
    func changeColorToGreen()
}

// Purpose: ColorPick, Where will Implemenet: In Presenter, Interator -> Presenter
protocol ColorPickerInteractorOutputProtocol: AnyObject {
    func didColor(_ value: Count.CountColor)
}

// Purpose: ColorPick, Where will Implemenet: In View, Presenter -> View
protocol ColorPickerViewProtocol: AnyObject {
    func updateColor(_ value: UIColor)
}

// Purpose: ColorPick Where will Implemenet: In Router, Presenter -> Router
protocol ColorPickerRouterProtocol {
    func goBackToCounter()
}

// Purpose: ColorPick, Where will Implemenet: In Coordinator, Router -> Coordinator
protocol ColorPickerRouterDelegate: AnyObject {
    func routeBackToCounter()
}
