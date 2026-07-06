//
//  ColorPickerInteractor.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 02/07/26.
//

final class ColorPickerInteractor {
    
    weak var presenter: ColorPickerInteractorOutputProtocol?
    
}

extension ColorPickerInteractor: ColorPickerInteractorProtocol {
    func changeColorToRed() {
        Count.shared.colour = .red
        presenter?.didColor(Count.shared.colour)
    }
    
    func changeColorToBlack() {
        Count.shared.colour = .black
        presenter?.didColor(Count.shared.colour)
    }
    
    func changeColorToBlue() {
        Count.shared.colour = .blue
        presenter?.didColor(Count.shared.colour)
    }
    
    func changeColorToGreen() {
        Count.shared.colour = .green
        presenter?.didColor(Count.shared.colour)
    }
}
