//
//  LaunchScreen.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 20/05/2021.
//

import SwiftUI

struct LaunchScreen: View {
    @State var bgImage = "Home"
    @State var buttonPressed = false
    let title = "WELCOME"
    let subtitle = "What's cooking?"
    let titleSize = CGFloat(70)
    let messageSize = CGFloat(24)
    let themeColor = Color.green

    var body: some View {
            // Above Image Layer
            VStack {
                
                Spacer().frame(height: 90)
                
                // Text
                VStack {
                    Text(title)
                        .font(.system(size: titleSize))
                        .fontWeight(.heavy)
                        .foregroundColor(themeColor)
                        .contrast(0.8)
                    Text(subtitle)
                        .foregroundColor(themeColor)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: messageSize))
                }
                .padding(.top, 150)
                
                Spacer().frame(height: 80)
                
                // Buttons
                VStack {
    
                    Spacer().frame(height: 100)
                    
                    Button(action: {
                        self.buttonPressed = true;
                    }, label: { Text("My Recipes")
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .frame(width: 130, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(themeColor)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                    } )
                    Spacer()
            }
            
        }
        .navigate(to: RecipesView(), when: $buttonPressed)
    }
}

    
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
