//
//  RecipeBuilder.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 04/07/2021.
//

import Foundation

/// This struct acts as our model for MVVM
/// It handles communication to the core data store and performs user intents where it can
struct RecipeBuilder {
    var recipes: [Recipe] = []
    
    func storeRecipe(_ name: String, _ id: UUID, _ ingredients: [String], _ instructions: [String], _ image: Data?) {
        
    }
}
