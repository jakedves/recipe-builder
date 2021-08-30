//
//  SharableRecipe.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 30/08/2021.
//

import Foundation

struct SharableRecipe: Codable {
    let name: String?
    let instructions: [String]?
    let ingredients: [String]?
    let image: Data?
    
    init(_ recipe: Recipe) {
        self.name = recipe.name
        self.instructions = recipe.instructions
        self.ingredients = recipe.ingredients
        self.image = recipe.image
    }
}
