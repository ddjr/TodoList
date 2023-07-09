//
//  LoginViewModel.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() {}
    
    func login() {
        guard validateText() else {
            return
        }
        // Firebase Login
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    func validateText() -> Bool {
        errorMessage = ""

        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              email.contains("@") && email.contains(".")
        else {
            errorMessage = "Missing valid email"
            return false
        }

        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Missing password"
            return false
        }

        return true
    }
}

