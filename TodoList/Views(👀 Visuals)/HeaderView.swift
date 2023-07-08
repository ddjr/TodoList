//
//  HeaderView.swift
//  TodoList
//
//  Created by David Daly on 7/7/23.
//

import SwiftUI

struct HeaderView: View {
    @State var backgroundColor: Color
    @State var textColor: Color
    @State var angle: Double
    @State var title: String
    @State var subtitle: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: -15))
                .offset(y: -100)
            VStack {
                Text(title)
                    .foregroundColor(textColor)
                    
                    .font(.title)
                    .bold()
                Text(subtitle)
                    .foregroundColor(textColor)
                    .font(.title2)
                    .bold()
            }
        }
                .frame(width: UIScreen.main.bounds.width * 3, height: 400)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(backgroundColor: Color.pink, textColor: Color.white, angle: -15, title: "Todo List", subtitle: "Get Things Done")
    }
}
