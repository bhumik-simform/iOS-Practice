//
//  CounterPresenter.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 30/06/26.
//

final class CounterPresenter {
    
    weak var view: CounterViewProtocol?
    
    var interactor: CounterInteractorProtocol?
    var router: CounterRouterProtocol?
}

extension CounterPresenter: CounterPresenterProtocol {
    
    func viewDidLoad() {
        interactor?.reset()
    }
    
    func incrementTapped() {
        interactor?.increment()
    }
    
    func decrementTapped() {
        interactor?.decrement()
    }
    
    func resetTapped() {
        interactor?.reset()
    }
    
    func colorPickerTapped() {
        router?.navigateToColorPicker()
    }
}

extension CounterPresenter: CounterInteratorOutputProtocol {
    func didReachedMaxLimit() {
        view?.disabledIncButton()
    }
    
    func didReachedMinLimit() {
        view?.disabledDecButton()
    }
    
    func didUpdateCount(_ value: Int) {
        view?.updateCount("Count: \(value)")
    }
}
