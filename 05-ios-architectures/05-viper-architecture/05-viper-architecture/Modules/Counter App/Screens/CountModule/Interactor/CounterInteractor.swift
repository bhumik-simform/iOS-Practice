//
//  Interactor.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 30/06/26.
//

final class CounterInteractor {
    
    weak var presenter: CounterInteratorOutputProtocol?
    
}

extension CounterInteractor: CounterInteractorProtocol {
    func increment() {
        Count.shared.value += 1
        if Count.shared.value > 10 {
            Count.shared.value -= 1
            presenter?.didReachedMaxLimit()
        } else {
            presenter?.didUpdateCount(Count.shared.value)
        }
    }
    
    func decrement() {
        Count.shared.value -= 1
        if Count.shared.value < -10 {
            Count.shared.value -= 1
            presenter?.didReachedMinLimit()
        } else {
            presenter?.didUpdateCount(Count.shared.value)
        }
    }
    
    func reset() {
        Count.shared.value = 0
        presenter?.didUpdateCount(Count.shared.value)
    }
}
