//
//  Ingredient.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 31/05/2021.
//

import Foundation

struct Ingredient: Hashable {
    
    var name: String
    var quantity: Quantity
    
    init(_ name: String, _ quantity: Quantity = Quantity(0, "")) {
        self.name = name
        self.quantity = quantity
    }
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.name == rhs.name && lhs.quantity == rhs.quantity
    }
    
    func toString() -> String {
        self.quantity == Quantity() ? self.name : "[\(quantity.toString())] \(name)"
    }
}


/**
 
 This structure can hold a quantity to be represented in the app, the unit should be restructicted to the set

 - g, mg, kg, ounces, pounds,
 - ml, L,
 - tsp, tbsp
 
 - amount  (e.g. 2 oranges, where unit = "")

 */
struct Quantity: Hashable {
    var amount: Double
    var unit: String // such as g, mg, kg, L, ml, ect..., can be blank (5 onions)
    
    init(_ amount: Double = 0, _ unit: String = "") {
        self.amount = amount
        self.unit = unit
    }
    
    static func == (lhs: Quantity, rhs: Quantity) -> Bool {
        lhs.amount == rhs.amount && lhs.unit == rhs.unit
    }
    
    func toString() -> String {
        self.amount == 0 && self.unit == "" ? "" : "\(amount) \(unit)"
    }
}
