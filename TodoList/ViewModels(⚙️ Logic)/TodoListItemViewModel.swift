//
//  TodoListItemViewModel.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import Foundation
/// VewModel for list of items view
/// Primary tab
class TodoListItemViewModel: ObservableObject {
    
    @Published var showingNewitemView = false
    init() {}
}
