//
//  PersistenceController.swift
//  Recipe-Builder
//
//  Created by Jake Davies on 16/08/2021.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer
    
    init(dataModel name: String) {
        container = NSPersistentCloudKitContainer(name: name)
        container.loadPersistentStores { (description, error) in
            
            if error != nil {
                print("Failed to load persistent stores from CloudKit container for data model: \(name)")
                return
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func fetchEntities<T>(entity name: String, entityType: T) -> [T]? where T: NSFetchRequestResult {
        let request = NSFetchRequest<T>(entityName: name)
        
        do {
            return try container.viewContext.fetch(request)
        } catch {
            return nil
        }
    }
    
    func fetchWithSort<T>(entity name: String, entityType: T, sortDescriptors: [NSSortDescriptor]) -> [T]? where T: NSFetchRequestResult {
        
        let request = NSFetchRequest<T>(entityName: name)
        request.sortDescriptors = sortDescriptors
        
        do {
            return try container.viewContext.fetch(request)
        } catch {
            return nil
        }
    }
}
