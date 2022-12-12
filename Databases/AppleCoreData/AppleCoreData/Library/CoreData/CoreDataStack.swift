//
//  CoreDataStack.swift
//

import CoreData

final class CoreDataStack {
    private let modelName: String
    
    init(for modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("[Error CoreDataStack] Failure to load persistent stores: \(error), \(error.userInfo)")
            }
        }
        
        return container
    }()
    
    private(set) lazy var readContext: NSManagedObjectContext = {
        let context = persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
        context.shouldDeleteInaccessibleFaults = true
        return context
    }()
    
    private lazy var editContext: NSManagedObjectContext = {
        persistentContainer.newBackgroundContext()
    }()
}

extension NSManagedObjectContext {
    func tryToSaveIfNeeded() {
        guard hasChanges else { return }
        
        do {
            try save()
        } catch {
            let error = error as NSError
            fatalError("[Error NSManagedObjectContext] Failure to save context \(error), \(error.userInfo)")
        }
    }
}

extension CoreDataStack {
    func saveContext() {
        editContext.tryToSaveIfNeeded()
    }
}

extension CoreDataStack {
    func editTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        editContext.perform { [weak self] in
            guard let editContext = self?.editContext else { return }
            
            block(editContext)
            editContext.tryToSaveIfNeeded()
        }
    }
}
