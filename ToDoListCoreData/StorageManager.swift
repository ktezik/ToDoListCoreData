//
//  StorageManager.swift
//  ToDoListCoreData
//
//  Created by Иван Гришин on 11.10.2021.
//

import UIKit
import Foundation
import CoreData

class StorageManager: UIResponder {
    static let shared = StorageManager()
    
    private override init() {}
    
    // MARK: - Core Data stack

    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoListCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
