//
//  RecipeBook.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 09/07/2021.
//

import SwiftUI
import CoreData

/// The RecipeBook is the view model that represents all the recipes a user has,
/// it communicates with the PersistenceController to load these recipes
class RecipeBook: ObservableObject {
    @Published var recipes: [Recipe]? = [] // checked in UI for error
    private let controller = RecipeStoreController.instance
    
    init() {
        refresh()
    }
    
    // MARK: - Intents
    /// This function reloads recipes, and should be called to update the recipes the user
    /// can see
    func refresh() {
        recipes = controller.fetchSortedRecipes()
    }
    
    /// This function tells the persistence controller to delete a recipe from core data once a user deletes it
    func delete(at offsets: IndexSet) {
        controller.delete(at: offsets)
        refresh()
    }
}
