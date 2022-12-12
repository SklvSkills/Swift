//
//  CoreDataManager.swift
//

import CoreData

final class CoreDataManager<Entity: NSManagedObject> {
    private let context: NSManagedObjectContext
    private let fetchRequest: NSFetchRequest<NSFetchRequestResult>
    
    init(_ context: NSManagedObjectContext,
         sortDescriptors: [NSSortDescriptor]? = nil,
         predicate: NSPredicate? = nil) {
        self.context = context
        
        fetchRequest = Entity.fetchRequest()
        
        if let sortDescriptors = sortDescriptors {
            fetchRequest.sortDescriptors = sortDescriptors
        }
        
        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }
    }
}

extension CoreDataManager {
    var count: Int {
        (try? context.count(for: fetchRequest)) ?? 0
    }
    
    var allObjects: [Entity]? {
        try? context.fetch(fetchRequest) as? [Entity]
    }
    
    var newObject: Entity {
        Entity(context: context)
    }
}

extension CoreDataManager {
    var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult> {
        NSFetchedResultsController(fetchRequest: fetchRequest,
                                   managedObjectContext: context,
                                   sectionNameKeyPath: nil,
                                   cacheName: nil)
    }
}

extension CoreDataManager {
    func delete(_ objects: [NSManagedObject]) {
        for object in objects {
            context.delete(object)
        }
    }
    
    func deleteAll() {
        guard let allObjects = allObjects else { return }
        
        delete(allObjects)
    }
}
