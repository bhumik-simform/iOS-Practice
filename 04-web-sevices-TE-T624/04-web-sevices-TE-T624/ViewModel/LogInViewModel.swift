//
//  LoginViewModel.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 08/06/26.
//

class LogInViewModel {
    
    private let repository = LogInRepository()
    
    func login(email: String, password: String)-> LogInResponce? {
        
        let logInRequest = LogInRequest(username: email, password: password)
        
        
        Task {
            
            do {
                
                let logInResponce = try await repository.login(with: logInRequest)
                
            } catch let error {
                print(error)
            }
            
        }
        
        return nil
    }
    
}
