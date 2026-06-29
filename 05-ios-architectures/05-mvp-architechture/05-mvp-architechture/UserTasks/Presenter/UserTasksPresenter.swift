//
//  UserTasksPresenter.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

protocol UserTasksView: AnyObject {
    func startLoading()
    func stopLoading()
    func onSuccess(data: [UserTask])
    func onError(message: String)
}

final class UserTasksPresenter {

    private var userTasks = [UserTask]()

    private weak var view: UserTasksView!

    init(_ view: UserTasksView) {
        self.view = view
    }

    func numberOfTasks() -> Int {
        return userTasks.count
    }

    func task(at position: Int) -> UserTask {
        return userTasks[position]
    }

    func fetchTasks(for userId: Int) {

        view.startLoading()

        Task {

            do {
                userTasks = try await NetworkServices.apiSerivce.fetchUserTasks(for: userId)

                await MainActor.run {
                    view.stopLoading()
                    view.onSuccess(data: userTasks)
                }
            } catch {
                
                await MainActor.run {
                    view.stopLoading()
                    view.onError(message: error.localizedDescription)
                }
            }
        }
    }
}
