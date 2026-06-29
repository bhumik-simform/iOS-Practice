//
//  UserTasksPresenter.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

protocol UserTasksView {

    func startLoding()
    func stopLoding()
    func onSucess(data: [UserTask])
    func onError(message: String)
}

class UserTasksPresenter {

    private var userTasks = [UserTask]()

    private var view: UserTasksView!

    init(_ view: UserTasksView) {
        self.view = view
    }

    func getTasksCount() -> Int {
        return userTasks.count
    }

    func getTaskAt(_ position: Int) -> UserTask {
        return userTasks[position]
    }

    func fetchTasks(for userId: Int) {

        view.startLoding()

        Task {

            do {
                userTasks = try await NetworkServices.apiSerivce.fetchUserTasks(for: userId)

                await MainActor.run {
                    view.stopLoding()
                    view.onSucess(data: userTasks)
                }
            } catch {
                
                await MainActor.run {
                    view.stopLoding()
                    view.onError(message: error.localizedDescription)
                }
            }
        }
    }
}
