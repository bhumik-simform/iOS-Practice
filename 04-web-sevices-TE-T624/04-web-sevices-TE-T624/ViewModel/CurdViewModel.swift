//
//  CurdViewModel.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 03/06/26.
//

class CurdViewModel {
    private let repository = CurdRepository()

    private(set) var userList = [User]()

    var reloadData: (() -> Void)?

    func fetchUsers() {
        repository.getUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.userList = users
                self?.reloadData?()
            case .failure(let error):
                print(error)
            }
        }
    }

    func createUser(name: String, userName: String, email: String) {

        let newUserRequest = CreateUserModel(
            name: name, username: userName, email: email)

        Task {
            do {

                let newCreatedUser = try await repository.createUser(
                    requestModel: newUserRequest)

                self.userList.append(newCreatedUser)
                self.reloadData?()

            } catch let error {
                print(error)
            }

        }
    }

}
