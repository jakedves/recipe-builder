//
//  RecipeBuillderModel.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 04/07/2021.
//

import Foundation

/// This struct acts as our model for MVVM
/// It handles communication to the core data store and performs user intents where it can
struct RecipeBuillderModel {
    var recipes: [Recipe] = []
    
    struct Recipe {
        var id: UUID { UUID() }
        var name: String
        var ingredients: [String]
        var instructions: [String]
        var image: Data?
    }
    
    func store(_ recipe: Recipe) {
        // save to core data store
    }
}
