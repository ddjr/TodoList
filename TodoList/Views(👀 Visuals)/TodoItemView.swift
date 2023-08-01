// add comment
//  TodoItemView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

struct TodoItemView: View {
    @StateObject var viewModel = TodoListItemViewModel()

    let item: Todo
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.green)
            }
        }
        .padding()
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView(item: .init(
            id: "123",
            title: "Get Eggs",
            dueDate: Date().timeIntervalSince1970,
            CreatedDate: Date().timeIntervalSince1970,
            isDone: true))
    }
}
