//
//  ToDolistModel.swift
//  TaskMaster
//
//  Created by ALY NABIL on 31/08/2024.
//

import Foundation

struct ToDoListItem: Codable {
    var id: String
    var content: String
    var dateTime: Date
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["is"] as? String ?? UUID().uuidString
        self.content = dictionary["content"] as? String ?? ""
        self.dateTime = (dictionary["dateTime"] as? TimeInterval).flatMap {Date(timeIntervalSince1970: $0)} ?? Date()
        
    }
    
}




