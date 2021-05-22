//
//  LaunchScreen.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 20/05/2021.
//

import SwiftUI

struct LaunchScreen: View {
    @State var bgImage = "Home"
    let titleSize = CGFloat(70)
    let messageSize = CGFloat(24)
    let textColor = Color.green
    
    var body: some View {
        ZStack {
            Image(bgImage)
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
                .frame(width: 1300, height: 400, alignment: .center)
                .position(x: 620, y: 400)
                .opacity(0.4)
            
            VStack {
                Spacer()
                Text("HELLO")
                    .font(.system(size: titleSize))
                    .fontWeight(.heavy)
                    .foregroundColor(textColor)
                    .contrast(0.8)
                Text("How are you?")
                    .foregroundColor(textColor)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: messageSize))
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
