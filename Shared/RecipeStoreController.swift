//
//  PersistenceController.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 16/08/2021.
//

import CoreData

class RecipeStoreController {
    static let instance = RecipeStoreController("RecipeBuilderModel")
    let container: NSPersistentContainer
    
    init(_ name: String) {
        container = NSPersistentCloudKitContainer(name: name)
        container.loadPersistentStores { (description, error) in
            
            if error != nil {
                print("Failed to load persistent stores from CloudKit container for data model: \(name) : \(error!.localizedDescription)")
                return
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func add(name: String, ingredients: [String], instructions: [String], image: Data?) {
        let ctx = self.container.viewContext
        let recipe = Recipe(context: ctx)
        
        recipe.id = UUID()
        recipe.name = name
        recipe.ingredients = ingredients
        recipe.instructions = instructions
        recipe.image = image
        
        ctx.insert(recipe)
        if ctx.hasChanges {
            do {
                try ctx.save()
            } catch {
                print("Saving new recipe has failed")
            }
        }
    }
    
    func edit(id: UUID, name: String, ingredients: [String], instructions: [String], image: Data?) {
        guard let recipe = get(with: id) else {
            add(name: name, ingredients: ingredients, instructions: instructions, image: image)
            return
        }
        print("Recipe with id \(id) loaded")
        
        recipe.name = name
        recipe.ingredients = ingredients
        recipe.instructions = instructions
        recipe.image = image
        
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("Saving recipe edits has failed")
            }
        }
        print("Recipe with id \(id) edited")
    }
    
    func get(with id: UUID) -> Recipe? {
        let predicate = NSPredicate(format: "id == %@", id as NSUUID)
        let fetchRequest = NSFetchRequest<Recipe>(entityName: "Recipe")
        fetchRequest.predicate = predicate
        
        let recipes = try? container.viewContext.fetch(fetchRequest)
        print("Fetch req with id completed")
        print("Fetched recipes: \(recipes ?? [])")
        return recipes?.first!
    }
    
    func fetchRecipes() -> [Recipe]? {
        try? container.viewContext.fetch(NSFetchRequest<Recipe>(entityName: "Recipe"))
    }
    
    func fetchSortedRecipes(sortDescriptors: [NSSortDescriptor] =  [NSSortDescriptor(keyPath: \Recipe.name, ascending: true)]) -> [Recipe]? {
        
        let request = NSFetchRequest<Recipe>(entityName: "Recipe")
        request.sortDescriptors = sortDescriptors
        
        return try? container.viewContext.fetch(request)
    }
    
    func delete(at offsets: IndexSet) {
        // Delete recipe from managed object context
        for index in offsets {
            let recipe = fetchSortedRecipes()![index]
            container.viewContext.delete(recipe)
        }
        
        // save changes
        do {
            if container.viewContext.hasChanges {
                try container.viewContext.save()
            }
        } catch {
            print("Deleting failed in RecipesBook()")
        }
    }
}
