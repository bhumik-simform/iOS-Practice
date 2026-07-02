//
//  Interactor.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 30/06/26.
//

final class CounterInteractor {
    
    private var count = 0
    weak var presenter: CounterInteratorOutputProtocol?
    
}

extension CounterInteractor: CounterInteractorProtocol {
    func increment() {
        count += 1
        presenter?.didUpdateCount(count)
    }
    
    func decrement() {
        count -= 1
        presenter?.didUpdateCount(count)
    }
    
    func reset() {
        count = 0
        presenter?.didUpdateCount(count)
    }
}
