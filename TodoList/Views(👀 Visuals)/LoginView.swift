//
//  LoginView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // MARK: Header
                HeaderView(
                    backgroundColor: Color.pink,
                    textColor: Color.white,
                    angle: -15,
                    title: "Todo List",
                    subtitle: "Get Things Done"
                )
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                // MARK: Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TLButton(
                        title: "Login",
                        background: .blue
                    ) {
                        viewModel.login()
                    }
                }
                
                // MARK: Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                        .foregroundColor(Color.blue)
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
