//
//  APIService.swift
//  04-web-sevices-TE-T624
//
//  Created by Bhumik Poshiya on 02/06/26.
//

import Foundation

final class GoTCharacterAPIService {
    
    
    func fetchCharacters (
        completion: @escaping(Result<[GoTCharacter],Error>) -> Void
    ) {
        guard let url = URL(string: "https://thronesapi.com/api/v2/Characters") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data else {
                return
            }
            
            do {
                let characters = try JSONDecoder().decode([GoTCharacter].self , from: data)
                completion(.success(characters))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
