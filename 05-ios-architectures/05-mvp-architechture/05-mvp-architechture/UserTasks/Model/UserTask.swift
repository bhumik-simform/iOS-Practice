//
//  UserTask.swift
//  05-mvp-architechture
//
//  Created by Bhumik Poshiya on 29/06/26.
//

struct UserTask: Decodable {

    let id: Int
    let title: String
    let isCompleted: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title = "todo"
        case isCompleted = "completed"
    }
}
