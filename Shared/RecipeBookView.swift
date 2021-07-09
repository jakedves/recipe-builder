//
//  RecipeBookView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 08/07/2021.
//

import SwiftUI

struct RecipeBookView: View {
    @ObservedObject private var recipeBook = RecipeBook()
    @State var showSheet = false
    
    var body: some View {
        NavigationView {
            
            // change to -1 to debug/edit
            if self.recipeBook.recipes.count > 0 {
                List {
                    ForEach (recipeBook.recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeRow(recipe)
                        }
                    }
                    .onDelete(perform: recipeBook.delete)
                }
                .navigationBarTitle(RV.title)
                .navigationBarItems(leading: RV.naviLeading,
                                    trailing: Button(action: {
                                        showSheet.toggle()
                                    }, label: {
                                        RV.buildIcon
                                    })
                                    .sheet(isPresented: $showSheet) {
                                        RV.newRecipeView
                                    })
                .listStyle(InsetListStyle())
                
            } else {
                RV.emptyView
                    .navigationBarTitle(RV.title)
                    .navigationBarItems(leading: RV.naviLeading,
                                        trailing: Button(action: {
                                            showSheet.toggle()
                                        },
                                        label: {
                                            RV.buildIcon
                                        })
                                        .sheet(isPresented: $showSheet) {
                                            RV.newRecipeView
                                        })
            }
        }
    }
    
    var row: some View {
        EmptyView()
    }
    
    private struct RV {
        static let title = "Recipes"
        static let naviLeading: some View = EditButton()
        static let buildIcon: some View = Image(systemName: "hammer")
        static let newRecipeView: some View = NewRecipeForm()
        
        static let emptyView: some View = Text("No recipes. Create a recipe using the hammer button above.")
            .multilineTextAlignment(.center).frame(width: 300)
        
    }
}

struct RecipeBookView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeBookView()
    }
}
