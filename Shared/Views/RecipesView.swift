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
    static var recipe_data = [Recipe(name: "Pog Rice Meal",
                              imageName: "Rice",
                              instructions: ["Cook rice", "Add drip", "Eat"],
                              ingredients: ["Rice", "Drip"]),
                              Recipe(name: "Coco Pops",
                              imageName: "CocoPops",
                              instructions: ["Add cereal", "Add milk", "Eat"],
                              ingredients: ["Cereal", "Milk"])]
    
    
    static var previews: some View {
        RecipesView(recipes: recipe_data)
    }
}
