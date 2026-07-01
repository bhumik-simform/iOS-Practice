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

    func editUser(
        originalUser: User, name: String, userName: String, email: String
    ) {

        var updatedUser = originalUser

        updatedUser.name = name
        updatedUser.userName = userName
        updatedUser.email = email

        if updatedUser == originalUser {
            print("No changes Lol")
            return
        }

        Task {

            do {

                let updatedUser = try await repository.updateUser(
                    newUser: updatedUser)

                let originalUserIndex =
                    self.userList.firstIndex {
                        $0.id == updatedUser.id
                    } ?? -1

                self.userList[originalUserIndex] = updatedUser
                self.reloadData?()

            } catch let error {
                print(error)
            }

        }

    }

    func deleteUser(userId: Int) {

        Task {

            do {

                try await repository.deleteUser(with: userId)
                self.userList.removeAll {
                    $0.id == userId
                }
                self.reloadData?()

            } catch let error {
                print(error)
            }

        }

    }

}
