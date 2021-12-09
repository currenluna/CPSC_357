//
//  AddDreamViewModel.swift
//  Curren_Taber_and_Aviv_Zohman_Project3
//
//  Created by cpsc on 12/8/21.
//

import Foundation
import CoreData

//this View Model is responsible for whatever is happening on the AddDream screen

class AddDreamViewModel: ObservableObject {
    
    //these are what DreamViewModel is capturing
    @Published var title: String = ""
    @Published var entry: String = ""
    
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    //function that saves data to persistent storage
    func save() {
        do {
            let dream = Dream(context: context)
            dream.title = title
            dream.entry = entry
            try dream.save()
        } catch {
            print(error)
        }
    }
}
