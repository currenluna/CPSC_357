//
//  DreamListViewModel.swift
//  Curren_Taber_and_Aviv_Zohman_Project3
//
//  Created by cpsc on 12/8/21.
//

import Foundation
import CoreData

//this is reponsible for providing the data to the Content View of the dreams

@MainActor
class DreamListViewModel: NSObject, ObservableObject {
    
    //whenever I add a new dream via AddNewDream, then this will notify DreamViewModel that something is added
    @Published var dreams = [DreamViewModel]()
    private let fetchedResultsController: NSFetchedResultsController<Dream>
    private (set) var context: NSManagedObjectContext
    
    //must pass in context to create a DreamListViewModel
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchedResultsController = NSFetchedResultsController(fetchRequest: Dream.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        //delegate means that whenever fetchedResultsController returns something, we need access to those things (We need to become a delegate)
        super.init()
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            guard let dreams = fetchedResultsController.fetchedObjects else {
                return
            }
            self.dreams = dreams.map(DreamViewModel.init)
        } catch {
            print(error)
        }
    }
    
    func deleteDream(dreamId: NSManagedObjectID) {
        do {
            guard let dream =  try context.existingObject(with: dreamId) as? Dream else {
                return
            }
            try dream.delete()
        } catch {
            print(error)
        }
    }
    

//
//    func getDream(dreamId: NSManagedObjectID) -> [Dream]{
//
//        let fetchRequest: NSFetchRequest<Dream> = Dream.fetchRequest()
//
//        do {
//            return try persistentContainer.viewContext.fetch(fetchRequest)
//        } catch {
//            return []
//        }
//    }
    
}

extension DreamListViewModel: NSFetchedResultsControllerDelegate {
    //this function will be called when content is updated
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        //make sure fetched objects are of type Dream
        guard let dreams = controller.fetchedObjects as? [Dream] else {
            return
        }
        self.dreams = dreams.map(DreamViewModel.init)
    }
}

//child model
//creates unique identifier per dream (Identifiable)
struct DreamViewModel: Identifiable {
    private var dream: Dream
    
    init(dream: Dream) {
        self.dream = dream
    }
    
    var id: NSManagedObjectID {
        dream.objectID
    }
    var title: String {
        dream.title ?? ""
    }
    var entry: String {
        dream.entry ?? ""
    }
}
