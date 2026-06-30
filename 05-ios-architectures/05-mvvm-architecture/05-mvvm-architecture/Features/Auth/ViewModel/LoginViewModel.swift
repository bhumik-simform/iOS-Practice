//
//  LoginViewModel.swift
//  05-mvvm-architecture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

import Combine
import Foundation

enum LoginUIState {
    case idle
    case loading // Starts Loding State in UI
    case onSuccess(data: LoginResponse) // when logins successfully
    case onError(message: String) // When Eroor Ouccured
}



final class LoginViewModel {
    
    @Published private(set) var loginUIState: LoginUIState = .idle
    
    private let repository: AppRepository
    
    init(repository: AppRepository = AppRepository()) {
        self.repository = repository
    }
    
    
    func login(userName: String, password: String) {
        
        loginUIState = .loading
        
        let request = LoginRequest(userName: userName, password: password)
        
        Task {
            
            do {
                let loginResponse = try await repository.login(request)
                
                loginUIState = .onSuccess(data: loginResponse)
                
            } catch {
                loginUIState = .onError(message: error.localizedDescription)
            }
        }
    }
}



