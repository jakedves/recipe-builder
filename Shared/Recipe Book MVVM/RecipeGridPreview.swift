//
//  RecipePreview.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import SwiftUI

struct RecipeGridPreview: View {
    @ObservedObject private var recipe: Recipe
    
    init(_ recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        ZStack {
            Image(optionalData: recipe.image)
                .centerCropped()
                .opacity(0.4)
            
            VStack {
                Spacer()
                Text(recipe.name ?? Row.defaultName)
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .foregroundColor(.black)
                    .padding()
            }
        }
        .cornerRadius(20)
    }
    
    private struct Row {
        static let defaultName: String = "Unnamed Recipe"
    }
}



struct RecipeCompactViewPreview_Previews: PreviewProvider {
    static let recipe = Recipe(context: RecipeStoreController.instance.container.viewContext)
    
    static var previews: some View {
        recipe.name = "A really yummy Recipe"
        
        return RecipeGridPreview(recipe)
    }
}
