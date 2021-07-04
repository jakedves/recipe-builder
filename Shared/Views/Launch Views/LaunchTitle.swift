//
//  LaunchTitle.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 04/07/2021.
//

import SwiftUI

struct LaunchTitle: View {
    let title: String
    let size: CGFloat
    let color: Color
    
    init(_ title: String, size: CGFloat = 50, color: Color = .green) {
        self.title = title
        self.size = size
        self.color = color
    }
    
    var body: some View {
        Text(title.uppercased())
            .font(.system(size: size))
            .foregroundColor(color)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
    }
}

struct LaunchTitle_Previews: PreviewProvider {
    static var previews: some View {
        LaunchTitle("Hello")
    }
}
