//
//  Recipe.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import Foundation

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var instructions: [Instruction]
    var ingredients: [Ingredient]
    
    init(name: String, imageName: String, instructions: [Instruction], ingredients: [Ingredient]) {
        self.name = name
        self.image = imageName
        self.instructions = instructions
        self.ingredients = ingredients
    }
    
}
