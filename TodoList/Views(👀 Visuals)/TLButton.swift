//
//  TLButton.swift
//  TodoList
//
//  Created by David Daly on 7/9/23.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Login", background: Color.blue) {
            // onClick()
        }
    }
}
