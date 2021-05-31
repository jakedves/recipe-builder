//
//  Recipe.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 22/05/2021.
//

import Foundation

struct Recipe: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var image: String
    var instructions: [String]
    var ingredients: [String]
    
    init(name: String, imageName: String, instructions: [String], ingredients: [String]) {
        self.name = name
        self.image = imageName
        self.instructions = instructions
        self.ingredients = ingredients
    }
    
}
