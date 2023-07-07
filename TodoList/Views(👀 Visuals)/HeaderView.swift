//
//  HeaderView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.pink)
                .rotationEffect(Angle(degrees: -15))
                .offset(y: -100)
            VStack {
                Text("Todo List")
                    .foregroundColor(Color.white)
                    
                    .font(.title)
                    .bold()
                Text("Get things done")
                    .foregroundColor(Color.white)
                    .font(.title2)
                    .bold()
            }
        }
                .frame(width: UIScreen.main.bounds.width * 3, height: 400)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
