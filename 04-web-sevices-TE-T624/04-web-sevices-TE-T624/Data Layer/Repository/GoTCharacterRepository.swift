//
//  GotCharRepository.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 02/06/26.
//

final class GoTCharacterRepository {
    private let apiService = GoTCharacterAPIService()
    
    func getCharacters(
        compltion: @escaping (Result<[GoTCharacter],Error>) -> Void
    ) {
        apiService.fetchCharacters(completion: compltion)
    }
}
