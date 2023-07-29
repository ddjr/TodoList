// add comment
//  RegisterViewModel.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validateText()
        else { return }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            // is uid present
            guard let userId = result?.user.uid
            else { return }
            
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    private func validateText() -> Bool {
        // Text must filled out
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else { return false }
        
        // Email must be vaild
        guard email.contains("@") && email.contains(".")
        else { return false }
        
        // Password must be 6+ characters
        guard password.count >= 6
        else { return false }
        
        return true
    }
}
