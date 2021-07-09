//
//  RecipeBuilder.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 09/07/2021.
//

import Foundation

// ViewModel for creating a new recipe
class RecipeBuilder: ObservableObject {
    @Published private var recipe = RecipeData() // Instantiate model
    
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
}


