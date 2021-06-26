//
//  RecipeGuide.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI
import UIKit

struct RecipeGuide: View {
    var recipe: Recipe
    var titleSize = CGFloat(40)
    let screenSize: CGRect
    let unnamed = "Unnamed Recipe"
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.screenSize = UIScreen.main.bounds
    }
    
    var body: some View {
        
        VStack {
            VStack {
                
                // The photo and recipe name
                VStack {
                    //RecipePhoto(Image(recipe.image) ?? Image("Logo"))
                    RecipePhoto("Logo")
                    Text(recipe.name ?? unnamed)
                        .fontWeight(.bold)
                        .font(.system(size: titleSize))
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                }
                
                // The ingredients and instructions
                HStack {
                    VStack(alignment: .leading) {
                        IngredientsView(recipe.ingredients ?? [])
                        Spacer().frame(height: 25)
                        InstructionsView(instructions: recipe.instructions ?? [])
                        Spacer().frame(height: 25)
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct RecipeGuide_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeGuide(recipe: AllRecipes.recipes()[0])
            RecipeGuide(recipe: AllRecipes.recipes()[0])
                .previewDevice("iPad Air (4th generation)")
        }
    }
}
