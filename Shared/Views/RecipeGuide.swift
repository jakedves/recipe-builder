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
    var image: String
    var instructions: [String]
    var ingredients: [String]
    var titleSize = CGFloat(40)
    let screenSize: CGRect
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.image = recipe.image
        self.instructions = recipe.instructions
        self.ingredients = recipe.ingredients
        self.screenSize = UIScreen.main.bounds
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
    }
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                Spacer().frame(width: 1, height: 40)
                HStack {
                    Spacer().frame(width: 20, height: 1)
                    Text(recipe.name)
                        .fontWeight(.bold)
                        .font(.system(size: titleSize))
                    Spacer()
                }
                RecipePhoto(recipe.image)
                    .frame(width: self.screenWidth)
                Spacer().frame(height: 25)
                IngredientsView(ingredients: ingredients)
                Spacer()
                // InstructionsView(instructions)
                Spacer()
            }
            Spacer()
        }
        
    }
}

struct RecipeGuide_Previews: PreviewProvider {
    static var previews: some View {
        RecipeGuide(recipe: Recipe(
                name: "Rice",
                imageName: "Rice",
                instructions: ["step 1", "step 2"],
                ingredients: ["Rice", "Sauce"]
            )
        )
    }
}
