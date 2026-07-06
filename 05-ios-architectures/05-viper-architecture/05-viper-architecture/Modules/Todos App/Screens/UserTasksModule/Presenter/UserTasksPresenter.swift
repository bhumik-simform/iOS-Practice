//
//  UserTasksPresenter.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 06/07/26.
//
import Foundation

final class UserTasksPresenter {
    
    weak var view: UserTasksViewProtocol!
    
    var interactor: UserTasksInteractorProtocol!
    var router: UserTasksRouterProtocol!
}

extension UserTasksPresenter: UserTasksPresenterProtocol {
    func fetchTasks(for userId: Int) {
        view.showLoadingState()
        interactor.fetchTasks(for: userId)
    }
    
    func numberOfTasks() -> Int {
        interactor.numberOfTasks()
    }
    
    func task(at position: Int) -> UserTask {
        interactor.task(at: position)
    }
}

extension UserTasksPresenter: UserTasksInteractorOutputProtocol {
    func onError(_ message: String) {
        DispatchQueue.main.async { [self] in
            view.hideLoadingState()
            view.showError(message)
        }
    }
    
    func onSucess() {
        DispatchQueue.main.async { [self] in
            view.hideLoadingState()
            view.onSucess()
        }
    }
}
