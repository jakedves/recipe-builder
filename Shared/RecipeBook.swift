//
//  RecipeBook.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 09/07/2021.
//

import Foundation
import CoreData

class RecipeBook: ObservableObject {
    let container: NSPersistentContainer
    @Published var recipes: [Recipe] = []
    
    private struct DataModel {
        //.xcdatamodel file name
        static let name = "RecipeBuilderModel"
        
        // entity name in that model
        static let entity = "Recipe"
        
        // error messages
        static let loadError = "Error loading data from Core Data: RecipeBook"
        static let fetchError = "Error fetching recipes from Core Data: RecipeBook "
    }
    
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
        fetchRecipes()
    }
    
    func fetchRecipes() {
        let request = NSFetchRequest<Recipe>(entityName: DataModel.entity)
        
        do {
            recipes = try container.viewContext.fetch(request)
        } catch let error {
            print(DataModel.fetchError + "\(error)")
        }
    }
    
    
}
