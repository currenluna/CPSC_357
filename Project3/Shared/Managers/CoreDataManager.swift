//
//  CoreDataManager.swift
//  Curren_Taber_and_Aviv_Zohman_Project3
//
//  Created by cpsc on 12/8/21.
//

import Foundation
import CoreData

//purpose of class is to initialize core data stack
class CoreDataManager {
    
    let persistentStoreContainer:NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init() {
        persistentStoreContainer = NSPersistentContainer(name: "DreamModel")
        persistentStoreContainer.loadPersistentStores{description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
    
    
}
