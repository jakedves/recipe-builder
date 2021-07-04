//
//  LaunchMessage.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 04/07/2021.
//

import SwiftUI

struct LaunchMessage: View {
    let message: String
    let size: CGFloat
    let color: Color
    
    var body: some View {
        Text(message)
            .font(.system(size: size))
            .foregroundColor(color)
            .fontWeight(.bold)
    }
}

struct LaunchMessage_Previews: PreviewProvider {
    static var previews: some View {
        LaunchMessage(message: "Hello there", size: 18, color: .green)
    }
}
