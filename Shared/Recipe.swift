//
//  Recipe.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import Foundation

struct Recipe: Identifiable {
    var id = UUID()
    var recipeName: String
    var imageFileName: String
    var instructions: [String]
    var ingredients: [String]
    
    init(name: String, imageFileName: String, instructions: [String], ingredients: [String]) {
        self.recipeName = name
        self.imageFileName = imageFileName
        self.instructions = instructions
        self.ingredients = ingredients
    }
    
}
