//
//  RecipeGuideHeading.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 04/07/2021.
//

import SwiftUI

struct RecipeGuideHeading: View {
    let heading: String?
    
    init(_ heading: String?) {
        self.heading = heading
    }
    
    var body: some View {
        Text(heading ?? Heading.unnamed)
            .fontWeight(.bold)
            .font(.system(size: Heading.size))
            .lineLimit(nil)
            .multilineTextAlignment(.center)
    }
    
    private struct Heading {
        static let size: CGFloat = 40
        static let unnamed: String = "Unnamed Recipe"
    }
}

struct RecipeGuideHeading_Previews: PreviewProvider {
    static var previews: some View {
        RecipeGuideHeading("My Recipe")
    }
}
