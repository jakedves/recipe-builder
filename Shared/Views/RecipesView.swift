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
            List {
                ForEach (recipes) { recipe in
                    NavigationLink(destination: RecipeGuide(recipe: recipe)) {
                        RecipeRow(recipe)
                    }
                }
                .onDelete(perform: self.delete)
            .navigationBarTitle(Text("Recipes"))
            .navigationBarItems(leading: EditButton(),
                                
                                trailing: Button("+") {
                                    showSheet.toggle()
                                }
                                    .sheet(isPresented: $showSheet) {
                                        NewRecipeForm()
                                    })
            .listStyle(InsetListStyle())
            }
        }
    }
    
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
