//
//  UserTasksInteractor.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 06/07/26.
//

final class UserTasksInteractor {

    let repository = TodosRepository()

    weak var presenter: UserTasksInteractorOutputProtocol?

    private var userTasks = [UserTask]()

}

extension UserTasksInteractor: UserTasksInteractorProtocol {
    func fetchTasks(for userId: Int) {

        Task {

            do {
                userTasks = try await repository.fetchUserTasks(for: userId)
                presenter?.onSucess()
            } catch {
                presenter?.onError(error.localizedDescription)
            }
        }
    }

    func numberOfTasks() -> Int {
        userTasks.count
    }

    func task(at position: Int) -> UserTask {
        userTasks[position]
    }
}
