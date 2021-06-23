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
    let textColor = Color.green
    let mainColor = AnyView(Color.green.contrast(0.8))
    
    // Collect recipe data

    var body: some View {
            // Above Image Layer
            VStack {
                
                Spacer().frame(height: 90)
                
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
                
                Spacer().frame(height: 80)
                
                // Buttons
                VStack {
    
                    Spacer().frame(height: 100)
                    
                    MainButton(size: 1.25,
                                text: "Recipes",
                                color: .green,
                                shadowColor: .green) {
                        self.buttonPressed = true;
                    }
                    Spacer()
            }
            
        }
        .navigate(to: RecipesView(recipes: AllRecipes.recipes), when: $buttonPressed)
    }
}

    
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
