//
//  UserTasksViewModel.swift
//  05-mvvm-architecture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

import Combine

enum UserTasksUIState {
    case idle
    case loading // Starts Loding State in UI
    case onSuccess // when logins successfully
    case onError(message: String) // When Eroor Ouccured
}


final class UserTasksViewModel {
    
    private let repository: AppRepository
    
    @Published private(set) var userTasksUIState: UserTasksUIState = .idle
    
    private var userTasks = [UserTask]()
    
    init(repository: AppRepository = AppRepository()) {
        self.repository = repository
    }
    
    
    func numberOfTasks() -> Int {
        userTasks.count
    }
    
    func task(at position: Int) -> UserTask {
        userTasks[position]
    }
    
    func fetchUsersTask(for userId: Int) {
        
        userTasksUIState = .loading
        
        Task {
            
            do{
                userTasks = try await repository.fetchUserTasks(for: userId)
                
                userTasksUIState = .onSuccess
            } catch {
                userTasksUIState = .onError(message: error.localizedDescription)
            }
        }
    }
}
