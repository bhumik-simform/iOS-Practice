//
//  NetworkServices.swift
//  05-mvc-architecture
//
//  Created by Bhumik Poshiya on 25/06/26.
//
import Alamofire
import Foundation

let baseUrl = "https://thronesapi.com/api/v2/Characters"

func fetchCharacters() async -> [GoTCharacter] {
    
    do {
        return try await AF.request(baseUrl).validate().serializingDecodable([GoTCharacter].self).value
    } catch {
        print("Error: \(error.localizedDescription)")
        return []
    }
}

func fectCharacter(charId: Int) async -> GoTCharDetails? {
   
    let url = "https://thronesapi.com/api/v2/Characters/\(charId)"
    
    do {
        return try await AF.request(url).validate().serializingDecodable(GoTCharDetails.self).value
    } catch {
        print("Error: \(error.localizedDescription)")
        return nil
    }
}
