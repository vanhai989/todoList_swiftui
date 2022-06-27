//
//  TodoItem.swift
//  todolist
//
//  Created by Hai Dev on 25/06/2022.
//

import Foundation


struct TodoItem: Identifiable, Hashable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var complete: Bool
    
    init(id: String = UUID().uuidString, title: String, complete: Bool) {
        self.id = id
        self.title = title
        self.complete = complete
    }
    
    func updateCompletion () -> TodoItem {
        return TodoItem(id: id, title: title, complete: !complete)
    }
}
