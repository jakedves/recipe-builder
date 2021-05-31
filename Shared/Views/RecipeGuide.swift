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
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.screenSize = UIScreen.main.bounds
        InstructionView.nextCount = 0
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
                    .frame(width: screenSize.width)
                Spacer().frame(height: 25)
                IngredientsView(recipe.ingredients)
                Spacer().frame(height: 35)
                InstructionsView(recipe.instructions)
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
                instructions: ["Boil rice for 10 minutes",
                               "Add vegetables",
                               "Add flavourings of choice",
                               "Enjoy your meal"],
                ingredients: ["Rice", "Sauce", "Vegetable Assortment"]
            )
        )
    }
}
