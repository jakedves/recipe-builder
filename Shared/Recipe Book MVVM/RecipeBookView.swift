//
//  RecipeBookView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 08/07/2021.
//

import SwiftUI

struct RecipeBookView: View {
    @EnvironmentObject private var recipeBook: RecipeBook
    @State private var building = false
    @State private var editing = false
    
    var body: some View {
        NavigationView {
            
            // change to -1 to debug/edit
            if self.recipeBook.recipes.count > 0 {
                List {
                    ForEach (recipeBook.recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView()
                                        .environmentObject(recipe)
                                        .navigationBarItems(trailing: edit)
                                        .sheet(isPresented: $editing, content: {
                                            RecipeBuilderForm(builder: RecipeBuilder(recipe: recipe, book: recipeBook))
                                        })) {
                            RecipeRowView(recipe)
                        }
                    }
                    .onDelete(perform: recipeBook.delete)
                }
                .navigationBarTitle(RV.title)
                .navigationBarItems(leading: RV.naviLeading,
                                    trailing: Button(action: {
                                        building.toggle()
                                    }, label: {
                                        RV.buildIcon
                                    })
                                    .sheet(isPresented: $building) {
                                        RecipeBuilderForm(builder: RecipeBuilder(book: recipeBook))
                                    })
                .listStyle(InsetListStyle())
                
            } else {
                RV.emptyView
                    .navigationBarTitle(RV.title)
                    .navigationBarItems(leading: RV.naviLeading,
                                        trailing: Button(action: {
                                            building.toggle()
                                        },
                                        label: {
                                            RV.buildIcon
                                        })
                                        .sheet(isPresented: $building) {
                                            RecipeBuilderForm(builder: RecipeBuilder(book: recipeBook))
                                        })
            }
        }
    }
    
    private var edit: some View {
        Button("Edit") {
            editing.toggle()
        }
        .padding()
    }
    
    private struct RV {
        static let title = "Recipe Book"
        static let naviLeading: some View = EditButton()
        static let buildIcon: some View = Image(systemName: "hammer")
        
        static let emptyView: some View = Text("No recipes. Create a recipe using the hammer button above.")
            .multilineTextAlignment(.center).frame(width: 300)
        
    }
}

struct RecipeBookView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeBookView().environmentObject(RecipeBook())
    }
}
