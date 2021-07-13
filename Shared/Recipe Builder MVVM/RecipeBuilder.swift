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
    @Published var name: String = ""
    @Published var ingredients: [String] = [""]
    @Published var instructions: [String] = [""]
    @Published var image: Data? = nil
    private var recipe: Recipe? = nil
    
    init(recipe: Recipe? = nil) {
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
        
        if recipe != nil {
            self.recipe = recipe
            setRecipe(recipe!)
        }
    }
    
    // MARK: - Intents
    
    func saveRecipe() throws {
        if recipe != nil {
            do {
                let editingRecipe = try loadRecipe(recipe!.id)
                if (editingRecipe != nil) {
                    editingRecipe!.image = image
                    editingRecipe!.instructions = instructions
                    editingRecipe!.ingredients = ingredients
                    editingRecipe!.name = name
                    try container.viewContext.save()
                    
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
        let recipe = Recipe(context: container.viewContext)
        
        recipe.id = UUID()
        recipe.name = name
        recipe.image = image
        recipe.ingredients = ingredients
        recipe.instructions = instructions
        
        container.viewContext.insert(recipe)
        try container.viewContext.save()
    }
    
    // MARK: - Data Handling
    private func loadRecipe(_ id : UUID) throws -> Recipe? {
        let predicate = NSPredicate(format: "id == %@", id as NSUUID)
        let fetchRequest = NSFetchRequest<Recipe>(entityName: DataModel.entity)
        fetchRequest.predicate = predicate
        
        let recipes = try container.viewContext.fetch(fetchRequest)
        if recipes.count == 1 {
            return recipes.first!
        } else {
            return nil
        }
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


