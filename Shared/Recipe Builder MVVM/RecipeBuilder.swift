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
    let container: NSPersistentContainer
    var loadedRecipe: Recipe? = nil
    @Published var name: String = ""
    @Published var ingredients: [String] = [""]
    @Published var instructions: [String] = [""]
    @Published var image: Data? = nil
    
    init() {
        container = NSPersistentContainer(name: DataModel.name)
        container.loadPersistentStores { (description, error) in
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

            /*
            Typical reasons for an error here include:
            * The parent directory does not exist, cannot be created, or disallows writing.
            * The persistent store is not accessible, due to permissions or data protection when the device is locked.
            * The device is out of space.
            * The store could not be migrated to the current model version.
            Check the error message to determine what the actual problem was.
            */
            if let error = error {
                print(DataModel.loadError + "\(error)")
            }
        }
    }
    
    // MARK: - Intents
    
    func saveNewRecipe() throws {
        try addNewRecipe(name, image, ingredients, instructions)
    }
    
    /// attempts to update a found recipe based on recipe's id, if loading fails, it creates a new recipe with the updated details
    func saveChangedRecipe(_ id: UUID) throws {
        do {
            // should only ever return one recipe
            let recipes = try loadRecipe(id)
            
            if recipes.count == 1 {
                recipes.first!.image = image
                recipes.first!.instructions = instructions
                recipes.first!.ingredients = ingredients
                recipes.first!.name = name
                try container.viewContext.save()
                // in the event a recipe isn't found, or more than one recipe share a UUID
            } else {
                try addNewRecipe(name, image, ingredients, instructions)
            }
        } catch {
            try addNewRecipe(name, image, ingredients, instructions)
        }
    }
    
    func addNewRecipe(_ name: String, _ image: Data?, _ ingredients: [String], _ instructions: [String]) throws {
        let recipe = Recipe(context: container.viewContext)
        
        recipe.id = UUID()
        recipe.name = name
        recipe.image = image
        recipe.ingredients = ingredients
        recipe.instructions = instructions
        
        container.viewContext.insert(recipe)
        try container.viewContext.save()
    }
    
    // MARK: -Data Handling
    private func loadRecipe(_ id : UUID) throws -> [Recipe] {
        let predicate = NSPredicate(format: "id == %@", id as NSUUID)
        let fetchRequest = NSFetchRequest<Recipe>(entityName: DataModel.entity)
        fetchRequest.predicate = predicate
        return try container.viewContext.fetch(fetchRequest)
    }
    
    // MARK: - Constants
    private struct DataModel {
        //.xcdatamodel file name
        static let name = "RecipeBuilderModel"
        static let entity = "Recipe"
        // error messages
        static let loadError = "Error loading data from Core Data: RecipeBuilder"
    }
}


