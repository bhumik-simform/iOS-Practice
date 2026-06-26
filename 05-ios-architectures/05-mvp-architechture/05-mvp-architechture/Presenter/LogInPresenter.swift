//
//  LogInPresenter.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 26/06/26.
//

protocol LogInView {
    
    func startLoading()
    func stopLoading()
    func showError(message errorMessage: String)
    func navigateHomeScreen(data result: LogInResponse)
    
    
}

class LogInPresenter {

    private var view: LogInView!
    
    init(view: LogInView) {
        
        self.view = view
        
    }

    func login(_ userName: String, _ password: String) {
        
        view.startLoading()
        
        let request = LogInRequest(userName: userName, password: password)
        
        Task {
            
            do {
                let loginResponse = try await NetworkServices.apiSerivce.login(request: request)
                
                view.stopLoading()
                view.navigateHomeScreen(data: loginResponse)
                
            } catch {
                view.stopLoading()
                view.showError(message: error.localizedDescription)
            }
            
        }
        
    }

}
