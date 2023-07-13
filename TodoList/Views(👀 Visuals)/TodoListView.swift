//
//  TodoListView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewModel()
    private let userid: String
    init(userid: String) {
        self.userid = userid
    }

    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userid: "")
    }
}
