//
//  Ingredient.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 31/05/2021.
//

import Foundation

struct Ingredient {
    var name: String
    var quantity: Quantity
    
    func toString() -> String {
        "\(quantity.toString()) [\(name)]"
    }
    
//    func generateView() -> InstructionView {
//
//    }
}


/**
 
 This structure can hold a quantity to be represented in the app, the unit should be restructicted to the set

 - g, mg, kg, ounces, pounds,
 - ml, L,
 - tsp, tbsp
 
 - amount  (e.g. 2 oranges, where unit = "")

 */
struct Quantity {
    var amount: Int
    var unit: String // such as g, mg, kg, L, ml, ect..., can be blank (5 onions)
    
    func toString() -> String {
        "\(amount) \(unit)"
    }
}
