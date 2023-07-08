//
//  RegisterView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            // MARK: Header
            HeaderView(backgroundColor: Color.yellow, textColor: Color.white, angle: 15, title: "Register", subtitle: "Sign Up Today")

        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
