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
                    ForEach(recipes) { recipe in
                        RecipeRow(recipe.name, recipe.image)
                    }
                }
            }
            .navigationTitle(Text("Recipes").font(.headline))
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(recipes: [Recipe(name: "Pog Rice Meal",
                                     imageName: "Rice",
                                     instructions: ["cook rice",
                                                    "add drip",
                                                    "eat rice"],
                                     ingredients: ["Rice",
                                                   "Drip",])
                                                            ])
    }
}
