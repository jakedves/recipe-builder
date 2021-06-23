//
//  RecipeDataStore.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 01/06/2021.
//

import Foundation

struct AllRecipes {
    static var recipes = [Recipe(name: "Pog Rice Meal",
                                     imageName: "Rice",
                                     
                                     instructions: ["Cook rice",
                                                    "Add drip",
                                                    "Eat"],
                                     
                                     ingredients: ["Rice",
                                                   "Drip"]),
                                    
                           Recipe(name: "Coco Pops",
                                     imageName: "CocoPops",
                                     instructions: ["Add cereal",
                                                    "Add milk",
                                                    "Eat"],
                                     
                                     ingredients: [
                                       "Cereal",
                                       "Milk"])
           ]

}
