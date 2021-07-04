//
//  LaunchScreen.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 20/05/2021.
//

import SwiftUI

struct LaunchScreen: View {
    @Environment(\.managedObjectContext) private var moc
    @State var buttonPressed = false
    
    var body: some View {
        if ($buttonPressed.wrappedValue) {
            RecipesView()
        } else {
            GeometryReader { geometry in
                VStack {
                    Spacer(minLength: (geometry.size.height / 2) - Launch.offset)
                    LaunchLogo(Launch.title,
                               Launch.titleSize,
                               Launch.message,
                               Launch.messageSize,
                               logo: Launch.logo,
                               Launch.color)
                    Spacer()
                    LaunchButton(Launch.buttonText,
                                 bgColor: Launch.color) {
                        $buttonPressed.wrappedValue.toggle()
                    }
                        
                    Spacer(minLength: Launch.minButtonHeight)
                }
                .buttonStyle(PlainButtonStyle())
            }
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
        static let minButtonHeight: CGFloat = 80
        
        static let offset: CGFloat = 85
    }
    
}

    
struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
