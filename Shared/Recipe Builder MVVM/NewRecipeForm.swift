//
//  NewRecipeForm.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 24/06/2021.
//

import SwiftUI

struct NewRecipeForm: View {
    @EnvironmentObject private var recipeBook: RecipeBook
    @ObservedObject private var builder: RecipeBuilder
    @Environment(\.presentationMode) var presentationMode
    @State private var badSave = false
    
    init(builder: RecipeBuilder) {
        self.builder = builder
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    recipeName
                    ingredientsFields
                    instructionsFields
                    camera
                }
            }
            .navigationTitle("Build Recipe")
            .navigationBarItems(leading: cancel,
                                trailing: save)
            .alert(isPresented: $badSave,
                   content: { alert })
        }
    }
    
    var recipeName: some View {
        TextField("Recipe Name", text: $builder.name)
    }
    
    var ingredientsFields: some View {
        VaryingTextFieldSection(title: "Ingredients:", placeholder: "New Ingredient", list: $builder.ingredients)
    }
    
    var instructionsFields: some View {
        VaryingTextFieldSection(title: "Instructions:", placeholder: "New Instruction", list: $builder.instructions)
    }
    
    var camera: some View {
        Section(header: Text("Add a photo")) {
            
        }
    }
    
    var cancel: some View {
        Button("Cancel") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    var save: some View {
        Button("Save") {
            do {
                try self.saveEntry()
            } catch {
                badSave = true
                print(error)
            }
        }
    }
    
    var alert: Alert {
        Alert(title: Text("Cannot save recipe"),
              dismissButton: .default(Text("OK")))
    }
    
    // Should delete element and fix all other elements in the list
    func deleteElement(at offsets: IndexSet, list: Binding<[String]>) {
        list.wrappedValue.remove(atOffsets: offsets)
    }
    
    func saveEntry() throws {
        // Delegate to view model
        try builder.finalise(book: recipeBook)
        
        // Close form
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeForm(builder: RecipeBuilder())
    }
}
