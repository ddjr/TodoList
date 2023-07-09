//
//  RegisterView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

struct RegisterView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            // MARK: Header
            HeaderView(
                backgroundColor: Color.yellow,
                textColor: Color.white,
                angle: 15,
                title: "Register",
                subtitle: "Sign Up Today"
            )
            Form {
                TextField("First Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                TextField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(
                    title: "Login",
                    background: .green
                ) {
                    // onClick()
                }
            }
            .offset(y: -50)
            
            Spacer()

        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
