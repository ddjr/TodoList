//
//  TodoListApp.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

