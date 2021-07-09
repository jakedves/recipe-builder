//
//  LaunchScreen.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 20/05/2021.
//

import SwiftUI

struct LaunchScreen: View {
    
    var body: some View {
        if ($buttonPressed.wrappedValue) {
            RecipeBookView()
        } else {
            GeometryReader { geometry in
                VStack {
                    Spacer(minLength: (geometry.size.height / 2) - Launch.offset)
                    self.logo
                    Spacer()
                    self.button
                    Spacer(minLength: Launch.minButtonHeight)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    private var title: some View {
        Text(Launch.title.uppercased())
            .font(.system(size: Launch.titleSize))
            .foregroundColor(Launch.color)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
    }
    
    private var message: some View {
        Text(Launch.message)
            .font(.system(size: Launch.messageSize))
            .foregroundColor(Launch.color)
            .fontWeight(.bold)
    }
    
    private var logo: some View {
        HStack {
            Spacer()
            Launch.logo
                .resizable()
                .frame(width: Launch.length, height: Launch.length)
            VStack {
                self.title
                self.message
            }
            Spacer()
        }
    }
    
    @State private var buttonPressed = false
    private var button: some View {
        Button() {
            $buttonPressed.wrappedValue.toggle()
        } label: {
            Text(Launch.buttonText)
                .padding()
                .foregroundColor(Launch.buttonTextColor)
                .background(Launch.color)
                .cornerRadius(Launch.buttonCurvature)
        }
    }
    
    
    
    private struct Launch {
        static let logo = Image("Logo")
        static let title = "Welcome"
        static let titleSize: CGFloat = 50
        static let message = "What's cooking?"
        static let messageSize: CGFloat = 18
        static let color = Color.green
        
        static let buttonText = "My Recipes"
        static let buttonTextColor: Color = .white
        static let minButtonHeight: CGFloat = 80
        static let buttonCurvature: CGFloat = 40
        
        static let length: CGFloat = 65
        
        static let offset: CGFloat = 85
    }
    
}

    
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
