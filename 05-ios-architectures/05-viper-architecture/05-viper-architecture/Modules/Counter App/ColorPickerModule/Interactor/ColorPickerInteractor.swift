//
//  ColorPickerInteractor.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 02/07/26.
//

final class ColorPickerInteractor {
    
    weak var presenter: ColorPickerInteractorOutputProtocol?
    
    private var labelColor: CountColor = .black
    
}

extension ColorPickerInteractor: ColorPickerInteractorProtocol {
    func changeColorToRed() {
        labelColor = .red
        presenter?.didColor(.red)
    }
    
    func changeColorToBlack() {
        labelColor = .black
        presenter?.didColor(.black)
    }
    
    func changeColorToBlue() {
        labelColor = .blue
        presenter?.didColor(.blue)
    }
    
    func changeColorToGreen() {
        labelColor = .green
        presenter?.didColor(.green)
    }
}
