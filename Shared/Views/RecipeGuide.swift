//
//  RecipeGuide.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 28/05/2021.
//

import SwiftUI

struct RecipeGuide: View {
    var recipe: Recipe
    var image: Image
    var instructions: [String]
    var ingredients: [String]
    var titleSize = CGFloat(40)
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.image = Image(recipe.image)
        self.instructions = recipe.instructions
        self.ingredients = recipe.ingredients
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer().frame(width: 1, height: 40)
            HStack {
                Spacer().frame(width: 70, height: 1)
                Text(recipe.name)
                    .fontWeight(.bold)
                    .font(.system(size: titleSize))
                Spacer()
            }
            RecipePhoto("Rice")
            Spacer()
            Spacer()
            // IngredientsView(ingredients)
            // InstructionsView(instructions)
        }
    }
}

struct RecipeGuide_Previews: PreviewProvider {
    static var previews: some View {
        RecipeGuide(recipe: Recipe(
                name: "Rice",
                imageName: "Home",
                instructions: ["step 1", "step 2"],
                ingredients: ["Rice", "Sauce"]
            )
        )
    }
}
