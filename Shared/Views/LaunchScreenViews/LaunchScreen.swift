//
//  LaunchScreen.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 20/05/2021.
//

import SwiftUI

struct LaunchScreen: View {
    @State var buttonPressed = false
    let title = "WELCOME"
    let subtitle = "What's cooking?"
    let titleSize = CGFloat(50)
    let messageSize = CGFloat(18)
    let themeColor = Color.green

    var body: some View {
        NavigationView {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    
                    // Text
                    LaunchLogo("Welcome",
                               CGFloat(50),
                               "What's cooking?",
                               CGFloat(18),
                               logo: Image("Logo"),
                               .green)
                    
                    Spacer()
                    
                    // Button
                    NavigationLink(destination: RecipesView()
                                    .navigationBarHidden(true)) {
                        Text("My Recipes")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(40)
                    }
                    
                    Spacer().frame(height: 130, alignment: .center)
                }
                Spacer()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

    
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchScreen()
            LaunchScreen()
                .previewDevice("iPad Air (4th generation)")
        }
    }
}
