//
//  LaunchButton.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 03/07/2021.
//

import SwiftUI

struct LaunchButton: View {
    let function: () -> Void
    let text: String
    let background: Color
    
    init(_ text: String, bgColor: Color, function: @escaping () -> Void) {
        self.text = text
        self.background = bgColor
        self.function = function
    }
    
    var body: some View {
        Button() {
            function()
        } label: {
            Text(text)
                .padding()
                .foregroundColor(LaunchButtonStandard.textColor)
                .background(background)
                .cornerRadius(LaunchButtonStandard.curvature)
        }
    }
    
    private struct LaunchButtonStandard {
        static let textColor = Color.white
        static let background = Color.green
        static let curvature: CGFloat = 40
    }
}

struct LaunchButton_Previews: PreviewProvider {
    static var previews: some View {
        LaunchButton("Example", bgColor: Color.green, function: { print("Example") })
    }
}
