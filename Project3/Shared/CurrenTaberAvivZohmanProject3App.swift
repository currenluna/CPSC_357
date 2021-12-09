//
//  CurrenTaberAvivZohmanProject3.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import SwiftUI

//  Main entry point for app
//  Starts at ContentView (AKA the list view)
@main
struct CurrenTaberAvivZohmanProject3: App {
    var body: some Scene {
        WindowGroup {
            
            //get access to view context
            let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
            
            //inject view context
            ContentView(vm: DreamListViewModel(context:viewContext)).environment(\.managedObjectContext, viewContext)
        }
    }
}

//Aviv Zohman Change
