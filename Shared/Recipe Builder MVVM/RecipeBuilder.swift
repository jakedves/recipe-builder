//
//  RecipeBuilder.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 09/07/2021.
//

import SwiftUI
import CoreData

// ViewModel for creating a new recipe, and editing a recipe
class RecipeBuilder: ObservableObject {
    @Published var recipeBook: RecipeBook // access needed for Core Data interface
    @Published var name: String = ""
    @Published var ingredients: [String] = [""]
    @Published var instructions: [String] = [""]
    @Published var image: Data? = nil
    @Published var recipe: Recipe? = nil
    
    init(recipe: Recipe? = nil, book: RecipeBook) {
        self.recipe = recipe
        self.recipeBook = book
        
        if recipe != nil {
            setRecipe(recipe!)
        }
    }
    
    // MARK: - Intents
    
    func saveRecipe() throws {
        if recipe != nil {
            do {
                let editingRecipe = try loadRecipe(recipe!.id!)
                if (editingRecipe != nil) {
                    editingRecipe!.image = image
                    editingRecipe!.instructions = instructions
                    editingRecipe!.ingredients = ingredients
                    editingRecipe!.name = name
                    try recipeBook.container.viewContext.save()
                    recipeBook.fetchRecipes()
                    
                    // in the event a recipe isn't found, or more than one recipe share a UUID
                } else {
                    try addNewRecipe(name, image, ingredients, instructions)
                }
            } catch {
                try addNewRecipe(name, image, ingredients, instructions)
            }
        } else {
            try addNewRecipe(name, image, ingredients, instructions)
        }
    }
    
    private func setRecipe(_ recipe: Recipe) {
        self.name = recipe.name!
        self.image = recipe.image
        self.ingredients = recipe.ingredients!
        self.instructions = recipe.instructions!
    }
    
    func addNewRecipe(_ name: String, _ image: Data?, _ ingredients: [String], _ instructions: [String]) throws {
        let recipe = Recipe(context: recipeBook.container.viewContext)
        
        
        recipe.id = UUID()
        recipe.name = name
        recipe.image = image
        
        // Empty strings will not be saved to help with UI
        var finalIngredients = ingredients
        var finalInstructions = instructions
        finalIngredients.removeAll(where: { stringIsEmpty($0) })
        finalInstructions.removeAll(where: { stringIsEmpty($0) })
        
        recipe.ingredients = finalIngredients
        recipe.instructions = finalInstructions
        
        recipeBook.container.viewContext.insert(recipe)
        try recipeBook.container.viewContext.save()
        recipeBook.fetchRecipes()
    }
    
    // MARK: - Data Handling
    private func loadRecipe(_ id : UUID) throws -> Recipe? {
        let predicate = NSPredicate(format: DataModel.query, id as NSUUID)
        let fetchRequest = NSFetchRequest<Recipe>(entityName: DataModel.entity)
        fetchRequest.predicate = predicate
        
        let recipes = try recipeBook.container.viewContext.fetch(fetchRequest)
        if recipes.count == 1 {
            return recipes.first!
        } else {
            return nil
        }
    }
    
    private func stringIsEmpty(_ string: String) -> Bool {
        string.replacingOccurrences(of: " ", with: "") == ""
    }
    
    // MARK: - Constants
    private struct DataModel {
        static let query = "id == %@"
        static let entity = "Recipe"
    }
}
