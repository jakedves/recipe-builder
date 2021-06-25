//
//  Recipe_BuilderApp.swift
//  Shared
//
//  Created by Jake Davies on 20/05/2021.
//

import SwiftUI

@main
struct Recipe_BuilderApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
