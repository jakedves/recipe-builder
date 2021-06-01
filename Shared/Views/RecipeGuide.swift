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
        
        RecipeGuide(recipe: Recipe(name: "Rice", imageName: "Rice",
            instructions: [Instruction("Boil rice for 10 minutes", index:1),
                           Instruction("Add vegetables", index: 2),
                           Instruction("Add flavourings of choice", index: 3),
                           Instruction("Enjoy your meal", index: 4)],
            ingredients: [Ingredient("Rice", Quantity(10, "g")),
                          Ingredient("Sauce", Quantity(20, "ml")),
                          Ingredient("Vegetable Assortment", Quantity()
                          )]
            )
        )
    }
}
