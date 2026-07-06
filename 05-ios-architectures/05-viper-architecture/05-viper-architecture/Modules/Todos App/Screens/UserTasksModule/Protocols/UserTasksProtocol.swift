//
//  UserTasksProtocols.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 06/07/26.
//

protocol UserTasksViewProtocol: AnyObject {
    func showLoadingState()
    func hideLoadingState()
    func showError(_ message: String)
    func onSucess()
}

protocol UserTasksPresenterProtocol {
    func fetchTasks(for userId: Int)
    func numberOfTasks() -> Int
    func task(at position: Int) -> UserTask
}

protocol UserTasksInteractorProtocol {
    func fetchTasks(for userId: Int)
    func numberOfTasks() -> Int
    func task(at position: Int) -> UserTask
}

protocol UserTasksInteractorOutputProtocol: AnyObject {
    func onError(_ message: String)
    func onSucess()
}

protocol UserTasksRouterProtocol {
    
}

protocol UserTasksRouterDelegate {
    
}
