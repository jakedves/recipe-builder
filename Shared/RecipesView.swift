//
//  RecipesView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import SwiftUI

struct RecipesView: View {
    @State var recipes: [Recipe] = [Recipe(name: "Epic",
                                           imageFileName: "Home",
                                           instructions: ["Cat"],
                                           ingredients: ["Pog"])]
    
    var body: some View {
        NavigationView {
            List {
                RecipeRow("Chicken", "Home")
                ForEach(recipes) { recipe in
                    RecipeRow(recipe.recipeName, recipe.imageFileName)
                }
            }
            .navigationTitle(Text("Recipes").font(.headline))
        }
        
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
