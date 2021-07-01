//
//  NewRecipeForm.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 24/06/2021.
//

import SwiftUI

struct NewRecipeForm: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @State var nextIngredient: String = ""
    @State var nextInstruction: String = ""
    @State var ingredients: [String] = []
    @State var instructions: [String] = []
    @State var showingAlert = false
    
    var body: some View {
        VStack {
            Form {
                
                Section(header: Text("Recipe Name:")) {
                    TextField("Recipe Name", text: $name)
                }
                
                Section(header: FormHeader(text: "Ingredients:",
                                           list: $ingredients,
                                           content: $nextIngredient)) {
                    List {
                        ForEach(ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                        .onDelete(perform: { indexSet in
                            deleteElement(at: indexSet, list: $ingredients)
                        })
                        TextField("New Ingredient",
                                  text: $nextIngredient)
                    }
                }
                
                Section(header: FormHeader(text: "Instructions:",
                                           list: $instructions,
                                           content: $nextInstruction)) {
                    List {
                        ForEach(instructions, id: \.self) { instruction in
                            Text(instruction)
                        }
                        .onDelete(perform: { indexSet in
                            deleteElement(at: indexSet, list: $instructions)
                        })
                        TextField("New Instruction", text: $nextInstruction)
                    }
                }
                
                Section(header: Text("Add a photo")) {
                    
                }
            }
        }
//        .navigationTitle("Build Recipe")
//        .navigationBarItems(
//            leading: Button("Cancel") {
//                self.presentationMode.wrappedValue.dismiss()
//            },
//            trailing: Button("Save") {
//                do {
//                    try self.saveEntry()
//                } catch {
//                    showingAlert = true
//                }
//            }).alert(isPresented: $showingAlert,
//                     content: {
//                        Alert(title: Text("Cannot save recipe"),
//                              dismissButton: .default(Text("OK")))
//                     })
    }
    
    func saveEntry() throws {
        
        // Create recipe object
        let recipe = Recipe(context: moc)
        recipe.id = UUID()
        recipe.name = name.capitalized // by default, users can change if preffered
        recipe.image = nil
        recipe.ingredients = ingredients
        recipe.instructions = instructions
        
        moc.insert(recipe)
        
        // Save to managedobjectcontext
        if moc.hasChanges {
            do {
                try moc.save()
            } catch {
                print(error)
                throw error
            }
        }
        
        // Close form
        presentationMode.wrappedValue.dismiss()
    }
    
    
    // Should delete element and fix all other elements in the list
    func deleteElement(at offsets: IndexSet, list: Binding<[String]>) {
        list.wrappedValue.remove(atOffsets: offsets)
    }
}

struct NewRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeForm()
    }
}
