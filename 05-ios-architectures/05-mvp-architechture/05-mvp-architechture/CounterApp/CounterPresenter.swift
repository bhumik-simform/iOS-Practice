//
//  CounterPresenter.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 26/06/26.
//

import Foundation

protocol CounterView: AnyObject {
    func showCount(_ count: Int)
}


class CounterPresenter {
    
    private var count = 0
    
    weak var counterView: CounterView?
    
    init(view: CounterView) {
        counterView = view
    }
    
    func viewDidLoad() {
        counterView?.showCount(count)
    }
    
    
    func increment() {
        count+=1
        counterView?.showCount(count)
    }

    func decrement() {
        count-=1
        counterView?.showCount(count)
    }
    
    func reset() {
        count = 0
        counterView?.showCount(count)
    }
    
}
