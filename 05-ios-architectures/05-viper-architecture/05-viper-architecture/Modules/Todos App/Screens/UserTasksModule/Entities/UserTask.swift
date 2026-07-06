//
//  UserTask.swift
//  05-viper-architecture
//
//  Created by Bhumik Poshiya on 06/07/26.
//

struct UserTask: Decodable {
    let taskId: Int
    let userId: Int
    let taskTitle: String
    let isCompleted: Bool
    
    private enum CodingKeys: String, CodingKey {
        case taskId = "id"
        case userId
        case taskTitle = "todo"
        case isCompleted = "completed"
    }
}
