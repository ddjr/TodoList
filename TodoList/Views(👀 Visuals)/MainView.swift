//
//  MainView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

// MARK: Main View

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // signed in
            TodoListView()
        } else {
            // NOT signed in
            VStack {
                LoginView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
