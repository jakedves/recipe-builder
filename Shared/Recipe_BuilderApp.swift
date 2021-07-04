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
            #if !os(macOS)
            LaunchScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            #else
            LaunchScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .frame(minWidth: macSettings.minWindowWidth,
                                 maxWidth: .infinity,
                                 minHeight: macSettings.minWindowHeight,
                                 maxHeight: .infinity,
                                 alignment: .center)
            #endif
        }
    }
    
    private struct macSettings {
        static let minWindowWidth = CGFloat(700)
        static let minWindowHeight = CGFloat(300)
    }
}
