//
//  CounterProtocol.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 30/06/26.
//

// View -> Presenter -> Interator
// Interator -> Presenter (If exists) -> View (If exists) there fore we inherite AnyObject Protocol so that we can make weakly couples relation

// Naming of protocol Purpose, Who Owns Implementation
// Uses or make refernces of protocol -> Implementes required methods of Protocol

// Purpose: Counter, Where will Implemenet: In Presenter, View -> Presenter
protocol CounterPresenterProtocol {
    func viewDidLoad()
    func incrementTapped()
    func decrementTapped()
    func resetTapped()
    func colorPickerTapped()
}

// Purpose: Counter, Where will Implemenet: In Interator, Presenter -> Interator
protocol CounterInteractorProtocol {
    func increment()
    func decrement()
    func reset()
}

// Purpose: Counter, Where will Implemenet: In Presenter, Interator -> Presenter
protocol CounterInteratorOutputProtocol: AnyObject {
    func didUpdateCount(_ value: Int)
}

// Purpose: Counter, Where will Implemenet: In View, Presenter -> View
protocol CounterViewProtocol: AnyObject {
    func updateCount(_ value: String)
}

// Purpose: Counter Where will Implemenet: In Router, Presenter -> Router
protocol CounterRouterProtocol {
    func navigateToColorPicker()
}
