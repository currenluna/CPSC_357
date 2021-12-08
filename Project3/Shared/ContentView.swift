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
            ZStack(alignment: .bottomTrailing) {
                // Background Color
                Color.purple_dark.edgesIgnoringSafeArea(.all)
                
                // VStack with Header and List
                VStack(alignment: .leading) {
                    // Header
                    Text("Dream Journal")
                        .font(Font.h1)
                        .foregroundColor(.blue_light)
                        .padding(.leading, 20)
                    // List of Journal Entries
                    List {
                        //  Creates a row for each Entry in journalStore
                        ForEach(journalStore.entries) { entry in
                            ListCell(entry: entry)
                        }
                        .onDelete(perform: deleteItems)
//                        .onMove(perform: moveItems) - No need to move, but here for reference
                        .listRowBackground(Color.purple_dark)
                        .listRowSeparator(.hidden)
                        .listRowSeparatorTint(Color.blue_light)
                        .listItemTint(.red)
                    }
                    .listStyle(.plain)
                    //  Buttons for adding new list items and editing the list
                    .navigationBarItems(leading: NavigationLink(destination: AddNewEntry(journalStore: self.journalStore)) {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }, trailing: EditButton().font(Font.butn))
                }
                
                NavigationLink(destination: AddNewEntry(journalStore: self.journalStore)) {
                    ZStack {
                        Circle()
                            .frame(width: 111, height: 111)
                            .foregroundColor(Color.blue_dark)
                            .padding()
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 0)
                        Rectangle()
                            .frame(width: 5, height: 69)
                            .foregroundColor(.blue_light)
                        Rectangle()
                            .frame(width: 69, height: 5)
                            .foregroundColor(.blue_light)
                    }
                }
            }
        }
        .accentColor(Color.blue_dark)
    }
    
    
    func addButton() {
        
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
        Group {
            ContentView()
        }
    }
}

//  Subview used within ContentView
//  Makes the code more organized
struct ListCell: View {
    var entry: Entry
    var body: some View {
        // A ZStack with a custom view on top of an empty NavigationLink
        ZStack {
            // Add an empty view to allow for a custom list row arrow
            NavigationLink(destination: EntryDetail(selectedEntry: entry)) {
                EmptyView()
            }
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(entry.name)
                            .font(Font.bod)
                        Text(entry.name)
                            .font(Font.h2)
                    }
                    Spacer()
                    Image(systemName: "chevron.right") // Allows for custom color
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, alignment: .trailing)
                }
                .foregroundColor(.blue_light)
                .padding(.top)
                .padding(.bottom)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.blue_light)
                
            }
        }
    }
}
