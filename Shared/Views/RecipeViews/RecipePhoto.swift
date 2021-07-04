//
//  RecipePhoto.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct RecipePhoto: View {
    let image: Image
    
    init(_ photo: String) {
        self.image = Image(photo)
            .resizable()
    }
    
    var body: some View {
        self.image
            .aspectRatio(contentMode: .fill)
            .frame(width: Photo.diameter, height: Photo.diameter)
            .clipped()
            .clipShape(Circle())
            .overlay(Circle()
                        .stroke(Photo.borderColor, lineWidth: Photo.borderWidth))
            .shadow(color: .green, radius: Photo.shadowRadius)
    }
    
    private struct Photo {
        static let diameter: CGFloat = 200
        static let borderColor: Color = .green
        static let borderWidth: CGFloat = 5
        static let shadowRadius: CGFloat = 4
    }
}

struct RecipePhoto_Previews: PreviewProvider {
    static var previews: some View {
        RecipePhoto("Rice")
    }
}
