//
//  RecipesView.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import SwiftUI


// [NSSortDescriptor(keyPath: \Recipe.dateCreated, ascending: true)]
// Add this
struct RecipesView: View {
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(entity: Recipe.entity(), sortDescriptors: []) var recipes: FetchedResults<Recipe>
    
    @State var showSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                // Hammer and edit buttons
                HStack {
                    Spacer()
                    Button(action: {
                        showSheet = true
                    },
                    label: {
                        Image(systemName: "hammer")
                            .sheet(isPresented: $showSheet) {
                                NewRecipeForm()
                            }
                    })
                }
                .padding([.top, .trailing], 7.0)
                
                // change to -1 to debug/edit
                if self.recipes.count > 0 {
                    List {
                        ForEach (recipes) { recipe in
                            NavigationLink(destination: RecipeGuide(recipe: recipe)) {
                                RecipeRow(recipe)
                            }
                        }
                        .onDelete(perform: self.delete)
                    }
                    .listStyle(SidebarListStyle())
                    .navigationTitle("Recipes")
                    
                    Spacer()
                } else {
                    Spacer()
                    Text("No recipes. Create a recipe using the"
                            + " hammer button above.")
                        .multilineTextAlignment(.center).frame(width: 300)
                    Spacer()
                    
                }
            }
        }
    }
    
    
    
    // When a user deletes an item it move remove itself from the recipe that is used to load the view, as well as the database
    func delete(at offsets: IndexSet) {
        
        // Delete recipe from managed object context
        for index in offsets {
            let recipe = recipes[index]
            moc.delete(recipe)
        }
        
        // save changes
        do {
            try moc.save()
        } catch {
            // handle core data error
            print("Saving failed in RecipesView()")
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}

