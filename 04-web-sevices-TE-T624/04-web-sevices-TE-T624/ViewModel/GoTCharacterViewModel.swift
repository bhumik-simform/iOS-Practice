//
//  CharistViewModel.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 02/06/26.
//

class GoTCharacterViewModel {

    private let repository = GoTCharacterRepository()

    private(set) var characters = [GoTCharacter]()

    var reloadData: (() -> Void)?

    func fetchCharacters() {
        repository.getCharacters { [weak self] result in
            
            switch result {
            case .success(let characters):
                self?.characters = characters
                self?.reloadData?()
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
