//
//  RecipesView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import SwiftUI

struct RecipesView: View {
    @State var recipes: [Recipe]
    @State var showSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach (recipes) { recipe in
                    NavigationLink(destination: RecipeGuide(recipe: recipe)) {
                        RecipeRow(recipe)
                    }
                }
                .onMove(perform: self.move)
                .onDelete(perform: self.delete)
            }
            .navigationBarTitle(Text("Recipes"))
            .navigationBarItems(leading: EditButton(),
                                trailing: Button("+") {
                                    showSheet.toggle()
                                }
                                    .sheet(isPresented: $showSheet) {
                                        NewRecipeForm() // Insert new recipe here
                                    })
            .listStyle(InsetListStyle())
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        recipes.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        recipes.remove(atOffsets: offsets)
    }
}

struct RecipesView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecipesView(recipes: AllRecipes.recipes())
    }
}
