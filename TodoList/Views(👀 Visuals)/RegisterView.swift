//
//  RegisterView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()

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
                TextField("First Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(
                    title: "Create Account",
                    background: .green
                ) {
                    viewModel.register()
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
