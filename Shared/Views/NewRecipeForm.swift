//
//  NewRecipeForm.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 24/06/2021.
//

import SwiftUI

struct NewRecipeForm: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @State var create: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Recipe Name", text: $name)
                    }
                    
                    Section {
                        List {
                            TextField("Create", text: $create)
                        }
                    }
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarItems(leading: Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
            },
                                trailing: Button("Save") {
                                    self.saveEntry()
                                })
        }
    }
    
    func saveEntry() {
        let recipe = Recipe()
        recipe.id = UUID()
        recipe.name = name
        // save to managedobjectcontext
    }
}

struct NewRecipeForm_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeForm()
    }
}
