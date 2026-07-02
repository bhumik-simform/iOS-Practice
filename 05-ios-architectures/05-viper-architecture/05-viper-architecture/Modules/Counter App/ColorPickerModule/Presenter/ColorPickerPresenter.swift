//
//  ColorPickerPresenter.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 02/07/26.
//

import UIKit

final class ColorPickerPresenter {
    
    weak var view: ColorPickerViewProtocol?
    
    var interactor: ColorPickerInteractorProtocol?
    var router: ColorPickerRouterProtocol?
    
}

extension ColorPickerPresenter: ColorPickerPresenterProtocol {
    
    func viewDidLoad() {
        interactor?.changeColorToRed()
    }
    
    func redTapped() {
        interactor?.changeColorToRed()
    }
    
    func blackTapped() {
        interactor?.changeColorToBlack()
    }
    
    func blueTapped() {
        interactor?.changeColorToBlue()
    }
    
    func greenTapped() {
        interactor?.changeColorToGreen()
    }
    
    func goBackCounterTapped() {
        router?.goBackToCounter()
    }
}

extension ColorPickerPresenter: ColorPickerInteractorOutputProtocol {
    
    func didColor(_ value: CountColor) {
        switch(value) {
        case .red: view?.updateColor(.red)
        case .black: view?.updateColor(.black)
        case .blue: view?.updateColor(.blue)
        case .green: view?.updateColor(.green)
        }
    }
}
