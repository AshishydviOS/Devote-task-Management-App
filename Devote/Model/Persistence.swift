//
//  Persistence.swift
//  Devote
//
//  Created by Ashish Yadav on 31/03/23.
//

import CoreData

struct PersistenceController {
    // MARK: - 1. PERSISTENT CONTROLLER
    static let shared = PersistenceController()
    
    // MARK: - 2. PERSISTENT CONTAINER
    let container: NSPersistentContainer

    // MARK: - 3. INITIALIZATION (load the persistent store)
    init(inMemory: Bool = false) {
        // load the xcDataModel file "Devote" in container mentioned below
        container = NSPersistentContainer(name: "Devote")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // MARK: - PREVIEW
    static var preview: PersistenceController = {
        // Switch to memory store
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        // We can setup any sample data in Preview
        for i in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Sample task no \(i)"
            newItem.completion = false
            newItem.id = UUID()
        }
        do {
            // Save the data in the Memory Store
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
