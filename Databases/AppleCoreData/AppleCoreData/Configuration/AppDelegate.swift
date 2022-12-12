//
//  AppDelegate.swift
//  AppleCoreData
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var privateCoreDataStack: CoreDataStack?
}

// Launch

extension AppDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

// Core Data stack (instead of a singleton)

extension AppDelegate {
    var coreDataStack: CoreDataStack {
        if let stack = privateCoreDataStack { return stack }
        
        let stack = CoreDataStack(for: "AppleCoreData")
        privateCoreDataStack = stack
        return stack
    }
}

// Terminate

extension AppDelegate {
    func applicationWillTerminate(_ application: UIApplication) {
        coreDataStack.saveContext()
    }
}
