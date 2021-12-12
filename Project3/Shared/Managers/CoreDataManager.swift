//
//  CoreDataManager.swift
//  Curren_Taber_and_Aviv_Zohman_Project3 (iOS)
//
//  Created by cpsc on 12/11/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "DreamCoreDataModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    func updateDream() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
        
    }
    
    func deleteDream(dream: Dream) {
        
        persistentContainer.viewContext.delete(dream)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
        
    }
    
    func getAllDreams() -> [Dream] {
        
        let fetchRequest: NSFetchRequest<Dream> = Dream.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
        
    }
    
    func saveDream(title: String, entry: String) {
        
        let dream = Dream(context: persistentContainer.viewContext)
        dream.title = title
        dream.entry = entry
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Failed to save dream \(error)")
        }
        
    }
    
}
