//
//  TodoListItemViewModel.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// VewModel for list of items view
/// Primary tab
class TodoListItemViewModel: ObservableObject {
    
    @Published var showingNewitemView = false
    init() {}
    
    func toggleIsDone(item: Todo) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let userId = Auth.auth().currentUser?.uid
        else { return }
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
