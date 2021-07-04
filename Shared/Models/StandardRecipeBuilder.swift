//
//  StandardRecipeBuilder.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 04/07/2021.
//

import Foundation

/// This class acts as our ViewModel,
/// which communicates user intents to the model, as well
/// as communicating model changes to the UI
class StandardRecipeBuilder: ObservableObject {
    static func createRecipeBuilder() -> RecipeBuilder {
        RecipeBuilder()
    }
    
    @Published var model = createRecipeBuilder()
    
    var recipes: [Recipe] {
        model.recipes
    }
    
    // MARK: - Intents
    func saveRecipe(name: String,
                   ingredients: [String],
                   instructions: [String],
                   image: Data? = nil) {
        
        model.storeRecipe(name, UUID(), ingredients, instructions, image)
    }
}
