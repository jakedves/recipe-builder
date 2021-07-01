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
                
                // Buttons
                HStack {
                    //Cancel
                    //Spacer
                    //Save
                }
                
                Section(header: Text("Recipe Name:")) {
                    TextField("Recipe Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Section(header: FormHeader(text: "Ingredients:",
                                           list: $ingredients,
                                           content: $nextIngredient)) {
                    
                    TextField("Add ingredient here", text: $nextIngredient)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    List {
                        ForEach(ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                        .onDelete(perform: { indexSet in
                            deleteElement(at: indexSet, list: $ingredients)
                        })
                        
                    }
                    .cornerRadius(20)
                    .frame(height: 15 * CGFloat(ingredients.count))
                }
                
                Section(header: FormHeader(text: "Instructions:",
                                           list: $instructions,
                                           content: $nextInstruction)) {
                    TextField("Type instruction here", text: $nextInstruction)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    List {
                        ForEach(instructions, id: \.self) { instruction in
                            Text(instruction)
                        }
                        .onDelete(perform: { indexSet in
                            deleteElement(at: indexSet, list: $instructions)
                        })
                    }
                    .cornerRadius(20)
                    .frame(height: 15 * CGFloat(instructions.count))
                }
                
                Section(header: Text("Add a photo")) {
                    
                }
                
                
            }
            .padding()
        }
        .frame(minWidth: 100,
               minHeight: macSettings.minWindowHeight)
        .background(Color.green.opacity(0.9))
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
    // TODO: Fix the .dropFirst to make it drop the numbers at the start
    // TODO: Make dropFirst optional and only apply to instructions
    func deleteElement(at offsets: IndexSet, list: Binding<[String]>) {
        list.wrappedValue.remove(atOffsets: offsets)
    }
}

struct NewRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeForm()
    }
}

