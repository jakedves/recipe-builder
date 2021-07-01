//
//  LaunchScreen.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 20/05/2021.
//

import SwiftUI

struct LaunchScreen: View {
    @State var buttonPressed = false
    var logo = LaunchLogo("Welcome",
                         50,
                         "What's cooking?",
                         18,
                         logo: Image("Logo"),
                         Color.green)
    
    var body: some View {
        if ($buttonPressed.wrappedValue) {
            RecipesView()
        } else {
            VStack {
                self.logo
                Button(action: {
                    self.buttonPressed = true
                },
                label: {
                    Text("My Recipes")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(40)
                })
                    
                Spacer().frame(height: 70)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
    
}

    
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
