//
//  BaseModel.swift
//  Curren_Taber_and_Aviv_Zohman_Project3
//
//  Created by cpsc on 12/8/21.
//

import Foundation
import CoreData

protocol BaseModel {
    static var viewContext: NSManagedObjectContext {get}
    func save() throws
    func delete() throws
//    func get() throws
}

extension BaseModel where Self: NSManagedObject{
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.persistentStoreContainer.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
//    
//    func get() throws {
//        
//    }
}
