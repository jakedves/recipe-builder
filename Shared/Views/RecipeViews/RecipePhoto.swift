//
//  RecipePhoto.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct RecipePhoto: View {
    var image: Image
    
    init(_ photo: String) {
        self.image = Image(photo)
            .resizable()
    }
    
    var body: some View {
        self.image
            .aspectRatio(contentMode: .fill)
            .frame(width: 230, height: 230)
            .clipped()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.green, lineWidth: 5))
            .shadow(color: .green, radius: 4)
    }
}

struct RecipePhoto_Previews: PreviewProvider {
    static var previews: some View {
        RecipePhoto("Rice")
    }
}
