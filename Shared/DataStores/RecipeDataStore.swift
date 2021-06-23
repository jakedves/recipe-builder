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
                                     
                                     instructions: [Instruction("Cook rice", index: 1),
                                                    Instruction("Add drip", index: 2),
                                                    Instruction("Eat", index: 3)],
                                     
                                     ingredients: [Ingredient("Rice", Quantity(100,"g")),
                                                   Ingredient("Drip", Quantity(20, "dr"))
                                     ]),
                                    
                                     Recipe(name: "Coco Pops",
                                     imageName: "CocoPops",
                                     instructions: [Instruction("Add cereal", index: 1),
                                                    Instruction("Add milk", index: 2),
                                                    Instruction("Eat", index: 3)
                                     ],
                                     
                                     ingredients: [
                                       Ingredient("Cereal", Quantity(100, "g")),
                                       Ingredient("Milk", Quantity(50, "ml"))
                                     ])
           ]

}
