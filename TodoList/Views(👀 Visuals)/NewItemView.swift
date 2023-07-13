//
//  NewItemView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
        
    }
    
    func save () {
        guard canSave
        else {
            return
        }
        // Get current user id
        guard let userID = Auth.auth().currentUser?.uid
        else {
            return
        }
        // Create a model
        let newID = UUID().uuidString
        let newItem = Todo(
            id: newID,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            CreatedDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(newID)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty
        else { return false }
        guard dueDate >= Date().addingTimeInterval(-86_400)
        else { return false }
        return true
    }
}

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool

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
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select due date that is today or newer.")
                )
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: .constant(true))
    }
}
