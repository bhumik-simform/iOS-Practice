//
//  LogInPresenter.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 26/06/26.
//

protocol LoginView: AnyObject {
    
    func startLoading()
    func stopLoading()
    func showError(message errorMessage: String)
    func onSuccess(data result: LoginResponse)
    
    
}

class LoginPresenter {

    private weak var view: LoginView!
    
    init(view: LoginView) {
        self.view = view
    }

    func login(_ userName: String, _ password: String) {
        
        view.startLoading()
        
        let request = LoginRequest(userName: userName, password: password)
        
        Task {
            
            do {
                let loginResponse = try await NetworkServices.apiSerivce.login(request: request) //MARK: Staring Network Calling
                
                view.stopLoading()
                view.onSuccess(data: loginResponse)
                
            } catch {
                view.stopLoading()
                view.showError(message: error.localizedDescription)
            }
            
        }
        
    }

}
