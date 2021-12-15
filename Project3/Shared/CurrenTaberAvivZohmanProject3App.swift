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
            ContentView(coreDM: CoreDataManager())
        }
    }
}
