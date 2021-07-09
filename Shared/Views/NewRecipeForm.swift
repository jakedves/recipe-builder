//
//  NewRecipeForm.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 24/06/2021.
//

import SwiftUI

struct NewRecipeForm: View {
    @EnvironmentObject private var recipeBook: RecipeBook
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    @State private var name: String = ""
    private var ingredients = VaryingTextFieldSection(title: "Ingredients", placeholder: "New Ingredient")
    private var instructions = VaryingTextFieldSection(title: "Instructions", placeholder: "New Instruction")
    
    init() {}
    
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
            .alert(isPresented: $showingAlert,
                   content: { alert })
        }
    }
    
    var recipeName: some View {
        TextField("Recipe Name", text: $name)
    }
    
    var ingredientsFields: some View {
        ingredients
    }
    
    var instructionsFields: some View {
        instructions
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
                showingAlert = true
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
        // Create recipe data
        let name = name == "" ? nil : name.capitalized
        let image: UIImage? = nil
        let ingredients = ingredients.data
        let instructions = instructions.data
        
        try recipeBook.addNewRecipe(name!, image, ingredients, instructions)
        
        // Close form
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeForm()
    }
}
