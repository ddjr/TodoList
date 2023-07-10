//
//  NewItemView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    
    init() {
        
    }
    
    func save () {}
}

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    var body: some View {
        VStack {
            Text("New Item")
                .font(.title)
                .bold()
                .padding()
            
            Form {
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                TLButton(title: "Save", background: .pink) {
                    viewModel.save()
                }
                .padding()
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView()
    }
}
