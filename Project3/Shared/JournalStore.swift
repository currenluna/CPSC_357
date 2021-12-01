//
//  JournalStore.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import SwiftUI
import Combine

//  Journal Store Class
//  Has a published list of Entries (automatically announces changes)
class JournalStore: ObservableObject {
    @Published var entries: [Entry]
    
    //  Initializer
    init(entries: [Entry] = []) {
        self.entries = entries
    }
}
