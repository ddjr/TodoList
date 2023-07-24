// add comment
//  Todo.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import Foundation

struct Todo: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let CreatedDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
