//
//  LaunchScreen.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 20/05/2021.
//

import SwiftUI

struct LaunchScreen: View {
    @State var bgImage = "Home"
    let title = "WELCOME"
    let subtitle = "What's cooking?"
    let titleSize = CGFloat(70)
    let messageSize = CGFloat(24)
    let textColor = Color.green
    let mainColor = AnyView(Color.green.contrast(0.8))
    
    // Collect recipe data

    var body: some View {
        ZStack {
            
            // Background
            Image(bgImage)
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
                .frame(width: 1300, height: 400, alignment: .center)
                .position(x: 620, y: 400)
                .opacity(0.4)
            
            // Above Image Layer
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                // Text
                VStack {
                    Text(title)
                        .font(.system(size: titleSize))
                        .fontWeight(.heavy)
                        .foregroundColor(textColor)
                        .contrast(0.8)
                    Text(subtitle)
                        .foregroundColor(textColor)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: messageSize))
                }
                .padding(.top, 150)
                
                Spacer()
                Spacer()
                
                // Buttons
                VStack {
    
                    Spacer().frame(height: 200)
                    
                    NavigationView {
                        VStack {
                            NavigationLink (destination: Text("Hi")) {
                                MainButton(size: 1.25,
                                           text: "New Recipe",
                                           color: .green,
                                           shadowColor: .green)
                            }
                            Spacer()
                            NavigationLink (destination: Text("Hi")) {
                                MainButton(size: 1.25,
                                           text: "Recipes",
                                           color: .green,
                                           shadowColor: .green)
                            }
                        }
                    }
                    .background(Color.white.opacity(0))
                    Spacer().frame(height: 150)
                }
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
