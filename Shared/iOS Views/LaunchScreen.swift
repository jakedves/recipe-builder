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
        GeometryReader { geometry in
            NavigationView {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        
                        // Text
                        self.logo
                            .offset(x: 0,
                                    y: buttonPressed ?
                                        -(geometry.size.height + 100) / 2
                                        : 0)
                            .animation(.spring())
                        
                        Spacer()
                        
                        // Button
                        NavigationLink(destination: RecipesView()
                                        .navigationBarHidden(true)) {
                            ZStack {
                                Text("My Recipes")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .cornerRadius(40)
                                Button("My Recipes") {
                                    self.animate()
                                }
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .cornerRadius(40)
                                    .hidden()
                            }
                        }
                        
                        Spacer().frame(height: 130, alignment: .center)
                    }
                    Spacer()
                }
                .animation(.spring())
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    
    func animate() {
        self.buttonPressed.toggle()
    }
    
}

    
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchScreen()
        }
    }
}
