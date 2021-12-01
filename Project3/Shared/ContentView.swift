//
//  ContentView.swift
//  Project #3
//
//  Created by Curren Taber and Aviv Zohman on 11/30/21.
//

import SwiftUI

//  Main List View
struct ContentView: View {
    //  Initializes journalStore to restaurantData
    @StateObject private var journalStore: JournalStore = JournalStore(entries: journalData)
    
    //  Body
    //  Its NavigationView contains NavigationLink (see ListCell)
    var body: some View {
        NavigationView {
            List {
                //  Creates a row for each Restaurant in journalStore
                ForEach(journalStore.entries) { entry in
                    ListCell(entry: entry)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("LA Restaurants"))
            //  Buttons for adding new list items and editing the list
            .navigationBarItems(leading: NavigationLink(destination: AddNewEntry(journalStore: self.journalStore)) {
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
    
    //  Enables user to delete list items
    func deleteItems(at offsets: IndexSet) {
        journalStore.entries.remove(atOffsets: offsets)
    }
    
    //  Enables user to move list items
    func moveItems(from source: IndexSet, to destination: Int) {
        journalStore.entries.move(fromOffsets: source, toOffset: destination)
    }
}

//  Preview Structure
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//  Subview used within ContentView
//  Makes the code more organized
struct ListCell: View {
    var entry: Entry
    var body: some View {
        NavigationLink(destination: EntryDetail(selectedEntry: entry)) {
            HStack {
                Image(entry.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white))
                    .shadow(radius: 3)
                    .padding(10)
                Text(entry.name)
                    .font(.headline)
            }
        }
    }
}
