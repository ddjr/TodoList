//
//  MainView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

// MARK: Main View

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
