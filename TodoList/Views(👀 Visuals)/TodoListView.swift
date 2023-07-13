//
//  TodoListView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewModel()
    @FirestoreQuery var items: [Todo]
    init(userid: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userid)/todos")
        // users/<id>/todos/<entries>
    }

    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            
                            
                        }
                }
                .listStyle(PlainListStyle())
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
        TodoListView(userid: "f0nT9pX5e0OOQ75JHJPQ8Xto4YZ2")
    }
}
