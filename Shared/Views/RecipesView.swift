//
//  RecipesView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import SwiftUI

struct RecipesView: View {
    @State var recipes: [Recipe]
    
    var body: some View {
        NavigationView {
            List (recipes) { recipe in
                NavigationLink(destination: RecipeGuide(recipe: recipe)) {
                    RecipeRow(recipe.name, recipe.image)
                }
            }
            .navigationTitle(Text("Recipes").font(.headline))
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var recipeData = [Recipe(name: "Pog Rice Meal",
                              imageName: "Rice",
                              
                              instructions: [Instruction("Cook rice", index: 1),
                                             Instruction("Add drip", index: 2),
                                             Instruction("Eat", index: 3)],
                              
                              ingredients: [Ingredient("Rice", Quantity(100,"g")),
                                            Ingredient("Drip", Quantity(20, "dr"))
                              ]),
                             
                              Recipe(name: "Coco Pops",
                              imageName: "CocoPops",
                              instructions: [Instruction("Add cereal", index: 1),
                                             Instruction("Add milk", index: 2),
                                             Instruction("Eat", index: 3)
                              ],
                              
                              ingredients: [
                                Ingredient("Cereal", Quantity(100, "g")),
                                Ingredient("Milk", Quantity(50, "ml"))
                              ])
    ]
    
    
    static var previews: some View {
        RecipesView(recipes: recipeData)
    }
}
