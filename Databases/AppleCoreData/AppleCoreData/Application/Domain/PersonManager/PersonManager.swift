//
//  PersonManager.swift
//  AppleCoreData
//

import CoreData

extension String {
    fileprivate static let name = "name"
    fileprivate static let formatById = "(id == %@)"
}

class PersonManager {
    private unowned let coreDataStack: CoreDataStack
    
    init(stack coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    private(set) lazy var fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult> = {
        let manager = CoreDataManager<Person>(coreDataStack.readContext,
                                              sortDescriptors: [NSSortDescriptor(key: .name, ascending: true)])
        
        let controller = manager.fetchedResultsController
        try? controller.performFetch()
        
        return controller
    }()
}

extension PersonManager {
    var count: Int {
        fetchedResultsController.sections?[0].numberOfObjects ?? 0
    }
    
    func person(by indexPath: IndexPath) -> Person? {
        fetchedResultsController.object(at: indexPath) as? Person
    }
}

extension PersonManager {
    func add(_ name: String) {
        coreDataStack.editTask { editContext in
            let newObject = CoreDataManager<Person>(editContext).newObject
            newObject.id = UUID()
            newObject.name = name
        }
    }
    
    func delete(by id: UUID) {
        coreDataStack.editTask { editContext in
            let manager = CoreDataManager<Person>(editContext,
                                                  predicate: NSPredicate(format: .formatById, argumentArray: [id]))
            manager.deleteAll()
        }
    }
}
