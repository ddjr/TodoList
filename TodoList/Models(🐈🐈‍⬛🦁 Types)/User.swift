//
//  User.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
