//
//  Main Button.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import SwiftUI


/**
    This is the button that will be used throughout the application
 */
struct MainButton: View {
    var size: CGFloat
    var text: String
    var textColor = Color.white
    var buttonColor = Color.blue
    var shadowColor = Color.blue
    var shadowOpacity = 0.5
    var shadowSize = CGFloat(10.0)
    var paddingSize = CGFloat(10.0)
    
    init(size: Double = 1.0, text: String, color: Color = .blue, textColor: Color = .white, shadowColor: Color = .blue, shadowSize: Double = 10.0, paddingSize: Double = 10.0) {
        
        self.size = CGFloat(size)
        self.text = text
        self.buttonColor = color
        self.textColor = textColor
        self.shadowColor = shadowColor
        self.shadowSize = CGFloat(shadowSize)
        self.paddingSize = CGFloat(paddingSize)
    }
    
    var body: some View {
        
        ZStack {
            Button(text) {}
            .padding(paddingSize)
            .foregroundColor(textColor)
            .background(buttonColor)
            .cornerRadius(15.0)
            .shadow(color: shadowColor.opacity(shadowOpacity),
                    radius: shadowSize)
            .scaleEffect(size)
        }
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(size: 1.5, text: "Click me")
    }
}
