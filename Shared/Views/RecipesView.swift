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
                    RecipeRow(recipe)
                }
            }
            .navigationTitle(Text("Recipes").font(.headline))
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var recipeData = AllRecipes.recipes
    
    static var previews: some View {
        RecipesView(recipes: recipeData)
    }
}
