//
//  RecipeBook.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 09/07/2021.
//

import SwiftUI
import CoreData

// ViewModel for deleting a recipe, and fetching recipes
class RecipeBook: ObservableObject {
    let container: NSPersistentContainer
    var loadFailed = false
    @Published var recipes: [Recipe]? = [] // make optional and check in UI
    
    
    init() {
        container = NSPersistentContainer(name: DataModel.name)
        container.loadPersistentStores { (description, loadError) in
            /*
            Typical reasons for an error here include:
            * The parent directory does not exist, cannot be created, or disallows writing.
            * The persistent store is not accessible, due to permissions or data protection when the device is locked.
            * The device is out of space.
            * The store could not be migrated to the current model version.
            Check the error message to determine what the actual problem was.
            */
            if let loadError = loadError {
                print(DataModel.loadError + "\(loadError)")
                self.loadFailed = true
                self.recipes = nil
            }
        }
        if !loadFailed {
            fetchRecipes()
        }
    }
    
    func fetchRecipes() {
        let request = NSFetchRequest<Recipe>(entityName: DataModel.entity)
        
        do {
            recipes = try container.viewContext.fetch(request)
        } catch let error {
            print(DataModel.fetchError + "\(error)")
        }
    }
    
    // MARK: - Intents
    func delete(at offsets: IndexSet) {
        
        // Delete recipe from managed object context
        for index in offsets {
            let recipe = recipes![index]
            container.viewContext.delete(recipe)
        }
        
        // save changes
        do {
            try container.viewContext.save()
        } catch {
            // handle core data error
            print("Deleting failed in RecipesBook()")
        }
        
        fetchRecipes()
    }
    
    // MARK: - Constants
    private struct DataModel {
        //.xcdatamodel file name
        static let name = "RecipeBuilderModel"
        
        // entity name in that model
        static let entity = "Recipe"
        
        // error messages
        static let loadError = "Error loading data from Core Data: RecipeBook"
        static let fetchError = "Error fetching recipes from Core Data: RecipeBook "
    }
}
