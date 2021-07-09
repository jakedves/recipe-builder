//
//  RecipeBuilder.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 09/07/2021.
//

import SwiftUI

// ViewModel for creating a new recipe
class RecipeBuilder: ObservableObject {
    private(set) var recipe = RecipeData() // Instantiate model
    @Published var name: String = ""
    @Published var ingredients: [String] = [""]
    @Published var instructions: [String] = [""]
    @Published var image: Data? = nil
    
    init() {}
    
    // MARK: - Intents
    func setName(_ name: String) {
        recipe.name = name
    }
    
    func addIngredient(_ ingredient: String) {
        recipe.ingredients.append(ingredient)
    }
    
    func addInstruction(_ instruction: String) {
        recipe.instructions.append(instruction)
    }
    
    func removeIngredient(_ ingredient: String) {
        recipe.ingredients.remove(at: recipe.ingredients.firstIndex(of: ingredient)!)
    }
    
    func removeInstruction(_ instruction: String) {
        recipe.instructions.remove(at: recipe.instructions.firstIndex(of: instruction)!)
    }
    
    func finalise(book: RecipeBook) throws {
        if (image != nil) {
            try book.addNewRecipe(name, UIImage(data: image!), ingredients, instructions)
        } else {
            try book.addNewRecipe(name, nil, ingredients, instructions)
        }
    }
}


