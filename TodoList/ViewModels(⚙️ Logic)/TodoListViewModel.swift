//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import Foundation
import FirebaseFirestore

/// View Model for list of items in view
class TodoListViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String

    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete todo list tiem
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
}
