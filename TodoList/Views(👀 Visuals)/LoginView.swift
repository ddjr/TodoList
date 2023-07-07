//
//  LoginView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            // MARK: Header
            HeaderView()
            
            // MARK: Login Form
            Form {
                TextField("Email Address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    // Attempt Login
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                        Text("Login")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
            }
            
            // MARK: Create Account
            VStack {
                Text("New around here?")
                Button("Create An Account") {
                    // Show Registration
                }
            }
            .padding(.bottom, 50)
            Spacer()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
